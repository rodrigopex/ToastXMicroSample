/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2

Page {
    Menu.definition: MenuDefinition{
        helpAction: HelpActionItem {
            onTriggered: {
                toast.close()
            }
        }
    }
    Container {
        layout: DockLayout {

        }
        Container {
            Button {
                text: "Show XToast"
                horizontalAlignment: HorizontalAlignment.Center
                onClicked: {
                    toast.open()
                    anim.play()
                }
            }
            ListView {
                dataModel: ArrayDataModel {
                    id: arr
                }
                onCreationCompleted: {
                    arr.append([ "test 0", "test 0", "test 0", "test 0", "test 0", "test 0", "test 0", "test 0",  ])
                }
            }
        }
        XToast {
            id: toast
            tapToClose: true
            mainMessage: "This is a test message!"
            secondaryMessage: "Loggin out"
        }
    }
}
