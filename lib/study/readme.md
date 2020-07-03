### 点击事件
    flutter中手势系统又两个独立的层。
    第一层具有原始指针事件，其描述屏幕上指针（触摸，鼠标和测针）的位置和移动。
    第二层具有手势，其描述由一个或多个指针移动组成的语义动作。
#### 指针 Listener
    指针表示用户与设备屏幕交互的原始数据。有四种类型的指针事件：
    1) PointerDownEvent指针已在特定位置与屏幕联系。
    2) PointerMoveEvent指针已从屏幕上的一个位置移动到另一个位置。
    3) PointerUpEvent指针已停止接触屏幕。
    4）PointerCancelEvent来自此指针的输入不再指向此应用。

#### 手势 GestureDetector inkwell
    表示从多个单独指针事件识别的语义动作(点击，拖动和缩放),甚至可能多个单独指针,
    手势可以分派多个事件，对应手势的生命周期(拖动开始，拖动更新和拖动结束)
#### 点击
    1) onTapDown 可能导致点击的指针已在特定位置与屏幕联系。
    2) onTapUp将触发敲击的指针已停止在特定位置接触屏幕。
    3) onTap 已经发生了敲击。
    4) onTapCancel之前触发的指针onTapDown不会导致点击。
#### 双击
    onDoubleTap 用户快速连续两次在同一位置点击屏幕。
#### 长按
    onLongPress 指针长时间保持与相同位置的屏幕接触。
#### 垂直拖动
    1) onVerticalDragStart指针已接触屏幕，可能会开始垂直移动。
    2) onVerticalDragUpdate 与屏幕接触并垂直移动的指针在垂直方向上的移动。
    3) onVerticalDragEnd之前与屏幕接触并垂直移动的指针不再与屏幕接触，并且在接触屏幕时以特定速度移动
#### 水平拖动
    1) onHorizontalDragStart 指针已接触屏幕，可能开始水平移动。
    2) onHorizontalDragUpdate 与屏幕接触并水平移动的指针在水平方向上移动。
    3) onHorizontalDragEnd 先前与屏幕接触并且水平移动的指针不再与屏幕接触，并且当它停止接触屏幕时以特定速度移动。

    onPanStart指针已接触屏幕，可能开始水平或垂直移动，如果onHorizontalDragStart或onVerticalDragStart设置了此回调，会导致崩溃。
    onPanUpdate指针与屏幕接触并沿垂直或水平方向移动，如果onHorizontalDragUpdate或onVerticalDragUpdate设置了此回调，会导致崩溃。
    onPanEnd之前与屏幕接触的指针不再与屏幕接触，并且在停止接触屏幕时以特定速度移动，如果onHorizontalDragEnd或onVerticalDragEnd设置了此回调，会导致崩溃。

