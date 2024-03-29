
#include "vision.h"

using namespace std;
using namespace cv;

int alignDoIt = false;
int valueh, valuev;

void ErrorParametros(){
    cout<<"Error en los parametros.\n Se usa:\n\n./main ARCHIVO_PARAMETROS OPCIONES ARCHIVO_IZQ ARCHIVO_DER\ndonde dice:\n\nARCHIVO_PARAMETROS: es el archivo que contiene los parámetros de la calibración de la cámara.\nOPCIONES: -i Imagenes -v Video\nARCHIVO_IZQ: es el archivo correspondiente a la camara izquierda(Sea una imagen o video)\nARCHIVO_DER: es el archivo correspondiente a la camara derecha(Sea una imagen o video)\nejemplo: \nPara imagenes:\n./main parameters.xml -i Image0_left.tif Image0_right.tif \nPara videos:\n./main parameters.xml -v cam_left.avi cam_right.avi"<<endl;
}

void moveImageH(const Mat& Im, int offset, Mat& res){

	//mueve la imagen Im horizontalmente y lo guarda en res
	cv::Mat_<Vec3b> mat(Im.size(), CV_8UC3);
	
	for(int i = 0; i < mat.rows; i++) {
		for(int j = 0; j < mat.cols; j++) {
			for (int c=0; c<3; c++){
			    if(j >= offset){
					if(0 <= j-offset && j-offset < Im.cols)
				    	mat.at<Vec3b>(i,j)[c] = Im.at<Vec3b>(i,j-offset)[c];
					else
						mat.at<Vec3b>(i,j)[c] = 0;
			    }else{
				    mat.at<Vec3b>(i,j)[c] = 0;
			    }			
			}
		}	
	}
	
	res = mat;
}

void moveImageV(const Mat& Im, int offset, Mat& res){

	//mueve la imagen Im verticalmente y lo guarda en res
	cv::Mat_<Vec3b> mat(Im.size(), CV_8UC3);
	
	for(int i = 0; i < mat.rows; i++) {
		for(int j = 0; j < mat.cols; j++) {
			for (int c=0; c<3; c++){
			    if(i >= offset){

					if(0 <= i - offset && i - offset < Im.rows)			
					    mat.at<Vec3b>(i,j)[c] = Im.at<Vec3b>(i - offset,j)[c];
					else			    
						mat.at<Vec3b>(i,j)[c] = 0;

				}else{
				    mat.at<Vec3b>(i,j)[c] = 0;
			    }			
			}
		}	
	}
    
	res = mat;
}

void map2Color(cv::Mat &left_disparities, cv::Mat &mat){
    int min_disparity = 0;
    
    for (int i = 0; i < mat.rows; i++) {
        for (int j = 0; j < mat.cols; j++) {
            //cout<<"disparity: "<<left_disparities.at<float>(i,j)<<endl;
            if (left_disparities.at<float>(i,j) > min_disparity) {
                
                float val = min(left_disparities.at<float>(i,j)*0.01f,1.0f);
                //cout<<"val: "<<val<<endl;
                if (val <= 0) {
                     mat.at<Vec3b>(i,j)[0] = 0;
                     mat.at<Vec3b>(i,j)[1] = 0;
                     mat.at<Vec3b>(i,j)[2] = 0;
                } else {
                    float h2 = 6.0f * (1.0f - val);
                    unsigned char x  = (unsigned char)((1.0f - fabs(fmod(h2, 2.0f) - 1.0f))*255);
                    if (0 <= h2&&h2<1) {
                        mat.at<Vec3b>(i,j)[0] = 255;
                        mat.at<Vec3b>(i,j)[1] = x;
                        mat.at<Vec3b>(i,j)[2] = 0;
                    }
                    else if (1<=h2&&h2<2)  {
                        mat.at<Vec3b>(i,j)[0] = x;
                        mat.at<Vec3b>(i,j)[1] = 255;
                        mat.at<Vec3b>(i,j)[2] = 0;
                    }
                    else if (2<=h2&&h2<3)  {
                        mat.at<Vec3b>(i,j)[0] = 0;
                        mat.at<Vec3b>(i,j)[1] = 255;
                        mat.at<Vec3b>(i,j)[2] = x;
                    }
                    else if (3<=h2&&h2<4)  {
                        mat.at<Vec3b>(i,j)[0] = 0;
                        mat.at<Vec3b>(i,j)[1] = x;
                        mat.at<Vec3b>(i,j)[2] = 255;
                    }
                    else if (4<=h2&&h2<5)  {
                        mat.at<Vec3b>(i,j)[0] = x;
                        mat.at<Vec3b>(i,j)[1] = 0;
                        mat.at<Vec3b>(i,j)[2] = 255;
                    }
                    else if (5<=h2&&h2<=6) {
                        mat.at<Vec3b>(i,j)[0] = 255;
                        mat.at<Vec3b>(i,j)[1] = 0;
                        mat.at<Vec3b>(i,j)[2] = x;
                    }
                }
            }
            else {
                mat.at<Vec3b>(i,j)[0] = 0;
                mat.at<Vec3b>(i,j)[1] = 0;
                mat.at<Vec3b>(i,j)[2] = 0;
            }
        }
    }
}

void alignImages(const Mat& img1_rect, const Mat& img2_rect, int* widthValue, int* heightValue ){
    cv::Mat_<Vec3b> res(img1_rect.cols*2, img1_rect.rows*2, CV_8UC3);
	cv::Mat_<Vec3b> res1(img1_rect.cols*2, img1_rect.rows*2, CV_8UC3);
	cv::Mat_<Vec3b> output(img1_rect.cols*2, img1_rect.rows*2, CV_8UC3);
	
	cv::namedWindow("imgRes", CV_WINDOW_AUTOSIZE);
    int setvalueh = 134;
    cv::createTrackbar("horizontal", "imgRes", &setvalueh, 256);
    
    int setvaluev = 128;
    cv::createTrackbar("vertical", "imgRes", &setvaluev, 256);

	while(cv::waitKey(200)<0){
		moveImageH(img1_rect, setvalueh - 128, res);
		moveImageV(res, setvaluev - 128, res1);
	    cv::addWeighted(img2_rect, 0.5, res1, 0.5, 1, output);
		cv::imshow("imgRes",output);
	}
	
	*widthValue = setvalueh;
	*heightValue = setvaluev;
}

void disparity(const Mat& img1, const Mat& img2, const Mat& mapx1, const Mat& mapy1, const Mat& mapx2, const Mat& mapy2,  Mat& mapDis1, Mat& mapDis2){

    cv::Mat_<Vec3b> img1_rect, img2_rect;
    
    cv::remap(img1, img1_rect, mapx1, mapy1, cv::INTER_LINEAR);
	cv::remap(img2, img2_rect, mapx2, mapy2, cv::INTER_LINEAR);
	//void remap(const Mat&  src, Mat&  dst, const Mat&  map1, const Mat&  map2, int interpolation, int borderMode=BORDER_CONSTANT, const Scalar& borderValue=Scalar())
    
    cv::Mat_<Vec3b> res1(img1_rect.cols, img1_rect.rows, CV_8UC3);
    cv::Mat_<Vec3b> temp1(img1_rect.cols, img1_rect.rows, CV_8UC3);
    cv::Mat_<Vec3b> res2(img2_rect.cols, img2_rect.rows, CV_8UC3);
    cv::Mat_<Vec3b> temp2(img2_rect.cols, img2_rect.rows, CV_8UC3);
    
    if(!alignDoIt){
        cout<<"Configuro los valores de desplazamiento"<<endl;
        
        //Interfaz grafica para alinear las imagenes
        //esta funcion devuelve los valores (horizontal y vertical respectivamente) a desplazar cada imagen
        alignImages(img1_rect, img2_rect, &valueh, &valuev);
        
        moveImageH(img1_rect, valueh - 128, temp1);
        moveImageV(temp1, valuev - 128, res1);

        //moveImageH(img2_rect, valueh - 128, temp2);
        //moveImageV(temp2, valuev - 128, res2);
        
        alignDoIt = true;
    }
    else{
        cout<<"uso los valores de desplazamiento definidos"<<endl;
        moveImageH(img1_rect, valueh - 128, temp1);
        moveImageV(temp1, valuev - 128, res1);

        //moveImageH(img2_rect, valueh - 128, temp2);
        //moveImageV(temp2, valuev - 128, res2);
    }
    
	cout<<valueh<<endl;
	cout<<valuev<<endl;
	
	Mat_<uchar> grayIm1_rect, grayIm2_rect;
    Mat_<uchar> grayIm1_rect2, grayIm2_rect2;

    cv::cvtColor(res1, grayIm1_rect, CV_RGB2GRAY);
    cv::cvtColor(img2_rect, grayIm2_rect, CV_RGB2GRAY);
	
	int32_t dims[3];
	dims[0] = grayIm1_rect.cols;
	dims[1] = grayIm1_rect.rows;
	dims[2] = grayIm1_rect.cols;
	//cout << mapDis1.cols << " " << mapDis1.rows << endl;
    
    equalizeHist(grayIm1_rect, grayIm1_rect2);
    equalizeHist(grayIm2_rect, grayIm2_rect2);
    
    /*cv::namedWindow("hist1", CV_WINDOW_AUTOSIZE);
    cv::imshow("hist1",grayIm1_rect2);
    
    cv::namedWindow("hist2", CV_WINDOW_AUTOSIZE);
    cv::imshow("hist2",grayIm2_rect2);*/
    
	// process
    Elas::parameters param;
    //param.postprocess_only_left = false;
    Elas elas(param);
    elas.process(grayIm2_rect2.data,grayIm1_rect2.data,(float*)mapDis1.data,(float*)mapDis2.data,dims);

    /*cv::Mat_<Vec3b> l1 (mapDis1.size()), l2 (mapDis2.size());
    
    map2Color(mapDis1, l1);
    mapDis1 = l1;
    
    map2Color(mapDis2, l2);
    mapDis2 = l2;*/
}

void initSize(String option, String nameFile, cv::Size& size){    
    if(option == "-i"){
        cv::Mat_<Vec3b> img;
        
        img = cv::imread(nameFile);
        size = img.size();
    }
    else if(option == "-v"){
        VideoCapture cap;
        cap.open(nameFile);
        cv::Mat frame;
        cap >> frame;
        size = frame.size();
    }
    else{
        ErrorParametros();
    }
}

void convertir(int num,char * cConvert){
    char aux;
    int i=0;
    int j;
    do{ 
        cConvert[i++]= (num % 10) + '0';
        num=num/10;
    }while (num>0);
    cConvert[i--]='\0';
    j=0;
    for (;i>j;i--,j++)
        {aux=cConvert[i];
        cConvert[i]=cConvert[j];
        cConvert[j]=aux;
    }
}

void capturarImagenesDesdeVideo(Mat& img_left, Mat& img_right, int numFrame){
    //levantamos los videos
    VideoCapture cap1, cap2;

    cap1.open("/home/aolmedo/videosTP4/cam1.avi"); 
    cap2.open("/home/aolmedo/videosTP4/cam2.avi");  
    cv::Mat_<Vec3b> frame1, frame2;
    int cantFrames = 0;
    string dir1, dir2, path1, path2;
    char numImg [4];
    dir1 = "/home/aolmedo/imgtpfinal/leftcam/";
    dir2 = "/home/aolmedo/imgtpfinal/rightcam/";
    for(;;){
    //leemos el frame de cada video
        cap1 >> frame1; 
        if(!frame1.data){
            cout<<"No hay mas frames primer video"<<endl;
            break;
        }
        cap2 >> frame2; 
        if(!frame2.data){
            cout<<"No hay mas frames segundo video"<<endl;
            break;
        }
        cantFrames++;
        
        //if(cantFrames % 20 == 0){
            convertir(cantFrames, numImg);
            path1 = dir1 + "leftcam_";
            path1 += numImg;
            path1 += ".tiff";
            path2 = dir2 + "rightcam_";
            path2 += numImg;
            path2 += ".tiff";
            cv::imwrite(path1, frame1);
            cv::imwrite(path2, frame2);
        //}
        //cap1 >> img_left; 
       //cap2 >> img_right; 
    }
    cout<<"cantidad de frames: "<<cantFrames<<endl;
    //cv::imwrite("output1.tiff", frame1);
    //cv::imwrite("output2.tiff", frame2);
}

void capturarImagenes(const char* deviceCamLeft, const char* deviceCamRight, Mat& img_left, Mat& img_right, int index){
    CvSize size = cvSize(640, 480);
    int fps = 15;
    //string deviceCamLeft ="/dev/video1";
    //string deviceCamRight ="/dev/video2";
    Camera camLeft(deviceCamLeft, size.width, size.height, fps);
    Camera camRight(deviceCamRight, size.width, size.height, fps);

    camLeft.setExposure(400);
    camRight.setExposure(400);


    camLeft.Update();
    camRight.Update();
    
    IplImage* frameLeft = cvCreateImage(size, IPL_DEPTH_8U, 3);
    IplImage* frameRight = cvCreateImage(size, IPL_DEPTH_8U, 3);

    camRight.toIplImage(frameRight);
    camLeft.toIplImage(frameLeft);
    
    img_left = frameLeft;
    img_right = frameRight;
    
    string path1, path2;
    char numImg [4];
    
    convertir(index, numImg);
    path1 = "leftcam_";
    path1 += numImg;
    path1 += ".tiff";
    path2 = "rightcam_";
    path2 += numImg;
    path2 += ".tiff";
    
    cv::imwrite(path1, img_left);
    cv::imwrite(path2, img_right);

}

int cantInfo(Mat& roi){
    int sum = 0;
    double disparity;
    for(int j = 0; j < roi.cols; j++){
        for(int i = 0; i < roi.rows; i++){
			//aca hay que castear bien y hacer el promedio
            disparity = (double) roi.at<float>(i,j);
            if( disparity > 0 ){
                sum++;
            }
		}
    }
    return sum;
}

void mejorROI(Mat& disparityMap, Mat& roi){
    //elige la mejor zona de interes.
    int mejorCantInfo = 0;
    int info;
    int index = 4;
    for(int i = 0; i < 9; i++){
        roi = disparityMap.rowRange(320 + (5 * i),360 + (5 * i));
        info = cantInfo(roi);
        if( info > mejorCantInfo ){
            mejorCantInfo = info;
            index = i;
        }
    }
    cout<<"rango: ("<<320 - (5 * index)<<", "<<360 - (5 * index)<<")"<<endl;
    roi = disparityMap.rowRange(320 - (5 * index),360 - (5 * index));
}

void capturarImagenesAvanzando(const char* deviceCamLeft, const char* deviceCamRight, Mat& img_left, Mat& img_right, int index){
    //mientras avanza captura varias imagenes y devuelve cierta informacion que ayuda a decidir para que lado ir.
}
