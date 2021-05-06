;------------------------
;   OpenGLdllプラグイン命令
;------------------------

;-------- header --------
%dll
HSPCL32.dll

%ver
4.00

%date
2014/09/04

%author
pippi

%note
hspcl32.as をインクルードしてください。

%type
GPGPU用プラグイン

%group
OpenGLdllプラグイン命令

%port
Win




;-------- ref --------

%index
glBindBuffer
bind a named buffer object
%prm
int p1,int p2
p1:GLenum target
p2:GLuint buffer

%inst
http://www.opengl.org/sdk/docs/man/html/glBindBuffer.xhtml

;--------

%index
glBufferData
creates and initializes a buffer object's data store

%prm
int p1,int p2,sptr p3,int p4
p1:GLenum target
p2:GLsizeiptr size
p3:const GLvoid * data
p4:GLenum usage

%inst
p3にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glBufferData.xhtml


;--------

%index
glDeleteBuffers
delete named buffer objects

%prm
int p1,sptr p2
p1:GLsizei n,
p2:const GLuint * buffers

%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glDeleteBuffers.xhtml


;--------

%index
glGenBuffers
generate buffer object names

%prm
int p1,sptr p2
p1:GLsizei n
p2:GLuint * buffers

%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glGenBuffers.xhtml

;--------

%index
glGenRenderbuffers
generate renderbuffer object names
%prm
int p1,sptr p2
p1:GLsizei n
p2:GLuint *renderbuffers

%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glGenRenderbuffers.xhtml

;--------

%index
glDeleteRenderbuffers
delete renderbuffer objects
%prm
int p1,sptr p2
p1:GLsizei n
p2:GLuint *renderbuffers

%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glDeleteRenderbuffers.xhtml

;--------


%index
glBindRenderbuffer
bind a renderbuffer to a renderbuffer target
%prm
int p1,int p2
p1:GLenum target
p2:GLuint renderbuffer

%inst
http://www.opengl.org/sdk/docs/man/html/glBindRenderbuffer.xhtml

;--------


%index
glRenderbufferStorage
establish data storage, format and dimensions of a renderbuffer object's image

%prm
int p1,int p2,int p3,int p4
p1:GLenum target
p2:GLenum internalformat
p3:GLsizei width
p4:GLsizei height

%inst
http://www.opengl.org/sdk/docs/man/html/glRenderbufferStorage.xhtml

;--------


%index
glGenVertexArrays
generate vertex array object names
%prm
int p1,stpr p2
p1:GLsizei n
p2:GLuint *arrays
 

%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glGenVertexArrays.xhtml

;--------


%index
glDeleteVertexArrays
delete vertex array objects
%prm
int p1,sptr p2
p1:GLsizei n
p2:const GLuint *arrays
%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glDeleteVertexArrays.xhtml

;--------


%index
glBindVertexArray
bind a vertex array object
%prm
int p1
p1:GLuint array
%inst
http://www.opengl.org/sdk/docs/man/html/glBindVertexArray.xhtml

;--------

%index
glGenFramebuffers
generate framebuffer object names
%prm
int p1,sptr p2
p1:GLsizei n
p2:GLuint *ids

%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glGenFramebuffers.xhtml

;--------


%index
glDeleteFramebuffers
delete framebuffer objects
%prm
int p1,sptr p2
p1:GLsizei n
p2:GLuint *framebuffers
%inst
p2にはvarptrでポインタ指定
http://www.opengl.org/sdk/docs/man/html/glDeleteFramebuffers.xhtml

;--------


%index
glBindFramebuffer
bind a framebuffer to a framebuffer target
%prm
int p1,int p2
p1:GLenum target
p2:GLuint framebuffer
%inst
http://www.opengl.org/sdk/docs/man/html/glBindFramebuffer.xhtml

;--------


%index
glFramebufferTexture2D
attach a texture image to a framebuffer object
%prm
int p1,int p2,int p3,int p4,int p5
p1:GLenum target
p2:GLenum attachment
p3:GLenum textarget
p4:GLuint texture
p5:GLint level

%inst
https://www.khronos.org/opengles/sdk/docs/man/xhtml/glFramebufferTexture2D.xml

;--------


%index
glFramebufferRenderbuffer
attach a renderbuffer object to a framebuffer object
%prm
int p1,int p2,int p3,int p4
p1:GLenum target
p2:GLenum attachment
p3:GLenum renderbuffertarget
p4:GLuint renderbuffer

%inst
https://www.khronos.org/opengles/sdk/docs/man/xhtml/glFramebufferRenderbuffer.xml

;--------


%index
glGenerateMipmap
generate a complete set of mipmaps for a texture object
%prm
int p1
p1:GLenum target

%inst
https://www.khronos.org/opengles/sdk/docs/man/xhtml/glGenerateMipmap.xml

;--------








































































































































%index
glBegin
%prm
int p1
%inst

;--------


%index
glBlendFunc
%prm
int p1, int p2
%inst

;--------


%index
glBindTexture
%prm
int p1,int p2
%inst

;--------


%index
glCallList
%prm
int p1
%inst

;--------


%index
glClear
%prm
int p1
%inst

;--------


%index
glClearColor
%prm
float p1,float p2,float p3,float p4
%inst

;--------


%index
glClearDepth
%prm
double p1
%inst

;--------


%index
glColorMask
%prm
int p1,int p2,int p3,int p4
%inst

;--------


%index
glColor3d
%prm
double p1, double p2, double p3
%inst

;--------


%index
glColor4d
%prm
double p1, double p2, double p3, double p4
%inst

;--------


%index
glColor3dv
%prm
sptr p1
%inst

;--------


%index
glColor4dv
%prm
sptr p1
%inst

;--------


%index
glColor3f
%prm
float p1,float p2,float p3
%inst

;--------


%index
glColor4f
%prm
float p1,float p2,float p3,float p4
%inst

;--------


%index
glColor3fv
%prm
sptr p1
%inst

;--------


%index
glColor4fv
%prm
sptr p1
%inst

;--------


%index
glColor3i
%prm
int p1,int p2,int p3
%inst

;--------


%index
glColor4i
%prm
int p1,int p2,int p3,int p4
%inst

;--------


%index
glColor3iv
%prm
sptr p1
%inst

;--------


%index
glColor4iv
%prm
sptr p1
%inst

;--------


%index
glCullFace
%prm
int p1
%inst

;--------


%index
glDepthFunc
%prm
int p1
%inst

;--------


%index
glDeleteLists
%prm
int p1,int p2
%inst

;--------


%index
glDisable
%prm
int p1
%inst

;--------


%index
glDisableClientState
%prm
int p1
%inst

;--------


%index
glDrawArrays
%prm
int p1,int p2,int p3
%inst

;--------


%index
glDrawElements
%prm
int p1,int p2,int p3,sptr p4
%inst

;--------


%index
glEnable
%prm
int p1
%inst

;--------


%index
glEnd
%prm

%inst

;--------


%index
glEnableClientState
%prm
int p1
%inst

;--------


%index
glEndList
%prm

%inst

;--------


%index
glFinish
%prm

%inst

;--------


%index
glFogf
%prm
int p1, float p2
%inst

;--------


%index
glFogi
%prm
int p1, int p2
%inst

;--------


%index
glFogfv
%prm
int p1,sptr p2
%inst

;--------


%index
glFogiv
%prm
int p1,sptr p2
%inst

;--------


%index
glFrustum
%prm
double p1, double p2, double p3, double p4, double p5, double p6
%inst

;--------


%index
glGenTextures
%prm
int p1,sptr p2
%inst

;--------


%index
glGetTexImage
%prm
int p1,int p2,int p3,int p4,sptr p5
%inst

;--------


%index
glGetIntegerv
%prm
int p1,sptr p2
%inst

;--------


%index
glGetDoublev
%prm
int p1,sptr p2
%inst

;--------


%index
glGenLists
%prm
(int p1)
%inst

;--------


%index
glGetTexLevelParameterfv
%prm
int p1,int p2,int p3,sptr p4
%inst

;--------


%index
glGetTexLevelParameteriv
%prm
int p1,int p2,int p3,sptr p4
%inst

;--------


%index
glLightfv
%prm
int p1,int p2,sptr p3
%inst

;--------


%index
glLightf
%prm
int p1,int p2,float p3
%inst

;--------


%index
glLighti
%prm
int p1,int p2,int p3
%inst

;--------


%index
glLightModelfv
%prm
int p1,int p2,int  p3
%inst

;--------


%index
glLineWidth
%prm
float p1
%inst

;--------


%index
glLoadIdentity
%prm

%inst

;--------


%index
glLoadMatrixd
%prm
sptr p1
%inst

;--------


%index
glMatrixMode
%prm
int p1
%inst

;--------


%index
glMaterialfv
%prm
int p1,int p2,sptr p3
%inst

;--------


%index
glNormal3d
%prm
double p1,double p2,double p3
%inst

;--------


%index
glNormal3dv
%prm
sptr p1
%inst

;--------


%index
glNormal3f
%prm
float p1,float p2,float p3
%inst

;--------


%index
glNormal3fv
%prm
sptr p1
%inst

;--------


%index
glNormal3i
%prm
int p1,int p2,int p3
%inst

;--------


%index
glNormal3iv
%prm
sptr p1
%inst

;--------


%index
glNormalPointer
%prm
int p1,int p2,sptr p3
%inst

;--------


%index
glNewList
%prm
int p1,int p2
%inst

;--------


%index
glOrtho
%prm
double p1, double p2, double p3, double p4, double p5, double p6
%inst

;--------


%index
glPixelStorei
%prm
int p1,int p2
%inst

;--------


%index
glPushMatrix
%prm

%inst

;--------


%index
glPopMatrix
%prm

%inst

;--------


%index
glPointSize
%prm
float p1
%inst

;--------


%index
glPolygonOffset
%prm
int p1,int p2
%inst

;--------


%index
glReadBuffer
%prm
int p1
%inst

;--------


%index
glReadPixels
%prm
int p1,int p2,int p3,int p4,int p5,int p6,sptr p7
%inst

;--------


%index
glRotated
%prm
double p1, double p2, double p3, double p4
%inst

;--------


%index
glRotatef
%prm
float p1,float p2,float p3,float p4
%inst

;--------


%index
glScaled
%prm
double p1, double p2, double p3
%inst

;--------


%index
glScalef
%prm
float p1,float p2,float p3
%inst

;--------


%index
glShadeModel
%prm
int p1
%inst

;--------


%index
glTexCoord2d
%prm
double p1,double p2
%inst

;--------


%index
glTexCoord2f
%prm
float p1,float p2
%inst

;--------


%index
glTexCoord2i
%prm
int p1,int p2
%inst

;--------


%index
glTexCoordPointer
%prm
int p1,int p2,int p3,sptr p4
%inst

;--------


%index
glTexEnvf
%prm
int p1,int p2,float p3
%inst

;--------


%index
glTexEnvi
%prm
int p1,int p2,int p3
%inst

;--------


%index
glTexImage2D
%prm
int p1,int p2,int p3,int p4,int p5,int p6,int p7,int p8,sptr p9
%inst

;--------


%index
glTexParameterf
%prm
int p1,int p2,float p3
%inst

;--------


%index
glTexParameterfv
%prm
int p1,int p2,sptr p3
%inst

;--------


%index
glTexParameteri
%prm
int p1,int p2,int p3
%inst

;--------


%index
glTexParameteriv
%prm
int p1,int p2,sptr p3
%inst

;--------


%index
glTexSubImage2D
%prm
int p1,int p2,int p3,int p4,int p5,int p6,int p7,int p8,sptr p9
%inst

;--------


%index
glTranslated
%prm
double p1, double p2, double p3
%inst

;--------


%index
glTranslatef
%prm
float p1,float p2,float p3
%inst

;--------


%index
glViewport
%prm
int p1,int p2,int p3,int p4
%inst

;--------


%index
glVertex2d
%prm
double p1, double p2
%inst

;--------


%index
glVertex3d
%prm
double p1, double p2, double p3
%inst

;--------


%index
glVertex4d
%prm
double p1, double p2, double p3, double p4
%inst

;--------


%index
glVertex2dv
%prm
sptr p1
%inst

;--------


%index
glVertex3dv
%prm
sptr p1
%inst

;--------


%index
glVertex4dv
%prm
sptr p1
%inst

;--------


%index
glVertex2f
%prm
float p1,float p2
%inst

;--------


%index
glVertex3f
%prm
float p1,float p2,float p3
%inst

;--------


%index
glVertex4f
%prm
float p1,float p2,float p3,float p4
%inst

;--------


%index
glVertex2fv
%prm
sptr p1
%inst

;--------


%index
glVertex3fv
%prm
sptr p1
%inst

;--------


%index
glVertex4fv
%prm
sptr p1
%inst

;--------


%index
glVertex2i
%prm
int p1,int p2
%inst

;--------


%index
glVertex3i
%prm
int p1,int p2,int p3
%inst

;--------


%index
glVertex4i
%prm
int p1,int p2,int p3,int p4
%inst

;--------


%index
glVertex2iv
%prm
sptr p1
%inst

;--------


%index
glVertex3iv
%prm
sptr p1
%inst

;--------


%index
glVertex4iv
%prm
sptr p1
%inst

;--------


%index
glVertexPointer
%prm
int p1,int p2,int p3,sptr p4
%inst

;--------


%index
wglCreateContext
%prm
(int p1)
%inst

;--------


%index
wglMakeCurrent
%prm
int p1, int p2
%inst

;--------


%index
wglDeleteContext
%prm
int p1
%inst

;--------


%index
wglGetCurrentDC
%prm
()
%inst

;--------


%index
gluLookAt
%prm
double p1, double p2, double p3, double p4, double p5, double p6, double p7, double p8, double p9
%inst

;--------


%index
gluPerspective
%prm
double p1, double p2, double p3, double p4
%inst

;--------


%index
ChoosePixelFormat
%prm
(int p1,sptr p2)
%inst

;--------


%index
SetPixelFormat
%prm
int p1, int p2,sptr p3
%inst

;--------


%index
SwapBuffers
%prm
int p1
%inst

;--------
