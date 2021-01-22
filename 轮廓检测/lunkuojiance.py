import cv2


# 直线拟合
def zhixian():
    img = cv2.imread("M00-02_00.jpg")
    pary = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  # 灰度图

    # findContours接受的参数为二值图，即黑白的（不是灰度图），所以读取的图像要先转成灰度的，再转成二值图
    ret, thresh = cv2.threshold(pary, 127, 255, cv2.THRESH_BINARY)  # 转化黑白图
    # python3为三个参数，contours轮廓的点集，hierarchy各层轮廓的索引
    contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    # 显示所有轮廓
    for contour in contours:
        if len(contour) > 1:
            for idx in range(-1, len(contour)-1):
                x0, y0 = contour[idx][0]
                x1, y1 = contour[idx+1][0]
                if (x0 == x1 and abs(y1-y0) > 100) or (y0 == y1 and abs(x1-x0) > 50):
                    cv2.line(img, (x0, y0), (x1, y1), (0, 255, 0), 2)
    cv2.imshow("test", img)
    cv2.waitKey(0)
    cv2.imwrite("tmp.jpg", img)
        
    cnt = contours[0]
    M = cv2.moments(cnt)
    print(M)

    rows, cols = img.shape[:2]
    [vx, vy, x, y] = cv2.fitLine(cnt, cv2.DIST_L2, 0, 0.01, 0.01)
    lefty = int((-x * vy / vx) + y)
    righty = int(((cols - x) * vy / vx) + y)
    img = cv2.line(pary, (cols - 1, righty), (0, lefty), (0, 255, 0), 2)
    cv2.imshow("test", img)
    cv2.waitKey(0)


# 轮廓检测
def lunkuo():
    img = cv2.imread("image.jpg")
    pary = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    edges = cv2.Canny(pary, 100, 200)
    cv2.imshow("test", edges)
    cv2.waitKey(0)
    cv2.imwrite("a.jpg", edges)


def shibie():
    # 设置边缘检测参数
    minval = 200
    maxval = 400
    img = cv2.imread("image.jpg")
    pary = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    edges = cv2.Canny(pary, minval, maxval)

    cv2.imshow("test", edges)
    cv2.waitKey(0)


zhixian()
