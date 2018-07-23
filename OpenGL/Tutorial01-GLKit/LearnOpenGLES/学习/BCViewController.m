//
//  BCViewController.m
//  LearnOpenGLES
//
//  Created by 狮博 on 2017/8/25.
//  Copyright © 2017年 林伟池. All rights reserved.
//

#import "BCViewController.h"
#import <GLKit/GLKit.h>
@interface BCViewController ()
@property(nonatomic,strong) EAGLContext * mContent;
@property(nonatomic,strong) GLKBaseEffect * mEffect;
@end

@implementation BCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpContent];
    
    [self setVertexArray];
    
    [self setTexture];
    // Do any additional setup after loading the view from its nib.
}
-(void)setUpContent
{
    self.mContent = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView * view = (GLKView *)self.view;
    view.context = self.mContent;
    
    view.drawableColorFormat = GLKViewDrawableColorFormatRGB565;
    [EAGLContext setCurrentContext:self.mContent];

}

-(void)setVertexArray
{
    GLfloat squareVerTexDara[] =
    {
        0.8, -0.8, 0.0f,    1.0f, 0.0f, //右下
        0.5, 0.5, -0.0f,    1.0f, 1.0f, //右上
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        -0.9, 0.5, 0.0f,    0.0f, 1.0f, //左上
        -0.5, -0.9, 0.9f,   0.0f, 0.0f, //左下
    
    };
    GLuint buffer;
    glGenBuffers(1, &buffer);
   
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(squareVerTexDara), squareVerTexDara, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (GLfloat *)NULL + 0);
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat) * 5, (CGFloat *)NULL + 3);

    
}

-(void)setTexture
{
    //纹理贴图
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"p" ofType:@"png"];
    NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:@(1), GLKTextureLoaderOriginBottomLeft, nil];//GLKTextureLoaderOriginBottomLeft 纹理坐标系是相反的
    GLKTextureInfo* textureInfo = [GLKTextureLoader textureWithContentsOfFile:filePath options:options error:nil];
    //着色器
    self.mEffect = [[GLKBaseEffect alloc] init];
    self.mEffect.texture2d0.enabled = GL_TRUE;


    self.mEffect.texture2d0.name = textureInfo.name;
}
-(void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(0.3, 0.5, 0.9, 1.0);
    
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    [self.mEffect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 6);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
