import bb.cascades 1.2

Container {
    id: self
    property bool tapToClose: false
    property alias mainMessage: mainMessage.text
    property alias secondaryMessage: secondaryMessage.text
    verticalAlignment: VerticalAlignment.Fill
    horizontalAlignment: HorizontalAlignment.Fill
    layout: DockLayout {
    }
    background: Color.create("#AA000000")
    opacity: 0.0
    touchPropagationMode: TouchPropagationMode.Full
    function open() {
        showAnimation.play()
    }
    function close() {
        hideAnimation.play()
    }
    Container {
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        leftPadding: 80
        rightPadding: 80
        Label {
            id: mainMessage
            multiline: true
            text: ""
            textStyle.base: SystemDefaults.TextStyles.BigText
            textStyle.color: Color.create("#88f8f8f8")
        }
    }
    gestureHandlers: TapHandler {
        onTapped: {
            if (self.tapToClose)
                self.close()
        }
    }
    Container {
        id: indicator
        translationY: indicator.preferredHeight
        leftPadding: 20
        bottomPadding: 20
        rightPadding: 20
        background: bg.imagePaint
        preferredHeight: 80
        verticalAlignment: VerticalAlignment.Bottom
        horizontalAlignment: HorizontalAlignment.Fill
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        animations: [
            TranslateTransition {
                id: showAnimation
                target: indicator
                fromY: indicator.preferredHeight
                toY: 0
                duration: 800
                easingCurve: StockCurve.QuarticOut
                onStarted: {
                    self.opacity = 1.0
                    touchPropagationMode:
                    TouchPropagationMode.None
                }
            },
            TranslateTransition {
                id: hideAnimation
                target: indicator
                fromY: 0
                toY: indicator.preferredHeight
                duration: 400
                easingCurve: StockCurve.QuarticIn
                onEnded: {
                    self.opacity = 0.0
                    touchPropagationMode:
                    TouchPropagationMode.Full
                }
            }
        ]
        Label {
            id: secondaryMessage
            text: "Loading..."
            verticalAlignment: VerticalAlignment.Bottom
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
        }
        ActivityIndicator {
            running: true
            verticalAlignment: VerticalAlignment.Bottom
        }
        attachedObjects: ImagePaintDefinition {
            id: bg
            imageSource: "asset:///bar.amd"
        }
    }
}