import { Button, VerticalBox, HorizontalBox, GridBox } from "std-widgets.slint";
import "../assets/SUSE-VariableFont_wght.ttf";
import "../assets/SUSE-Regular.ttf";
import "../assets/SUSE-Light.ttf";
import { Globals } from "globals.slint";


export component YoutubePage {

    VerticalLayout {

        HorizontalLayout {

            padding-left: 30px;
            padding-right: 30px;
            padding-top: 10px;
            height: 80px;
            width: 100%;
            alignment: space-between;
            Rectangle {
                clip: true;
                TouchArea {
                    HorizontalBox {
                        alignment: center;
                        padding: 0px;
                        Image {
                            colorize: Globals.themeStatus;
                            vertical-alignment: center;
                            source: @image-url("../assets/night-mode.png");
                        }

                        Text {
                            vertical-alignment: center;
                            horizontal-alignment: right;
                            text: "Dark Mode";
                            font-family: "Vazirmatn";
                            font-weight: 900;
                            font-size: 16px;

                            color: Globals.themeStatus;
                        }
                    }

                    clicked => {
                        Globals.switchTheme();
                    }
                }
            }

            Rectangle { }

            TouchArea {
                clicked => {
                    Globals.close();
                }
                Image {
                    image-fit: contain;
                    source: @image-url("../assets/close.png");
                }
            }
        }

       

        VerticalLayout {
            
            h := HorizontalLayout {

                padding-left: 30px;
                padding-top: 0px;
                padding-right: 30px;
                height: 90px;
                width: 100%;
                alignment: space-between;
                Rectangle {
                    clip: true;
                    ret := TouchArea {
                         HorizontalBox {
                            alignment: center;
                            padding: 0px;
                            
                            Image {
                                width: 100px;
                                height: 100%;
                                colorize: ret.has-hover ? @radial-gradient(circle, #25d9a2, #0a6f52, #2687ce, #1a71b0) : @radial-gradient(circle, #25d9a2, #1bb085, #2687ce, #2687ce);
                                vertical-alignment: center;
                                source: @image-url("../assets/media_master.png");
                            }
    
                            Text {
                                vertical-alignment: center;
                                horizontal-alignment: left;
                                text: "MediaMaster";
                                font-family: "SUSE-Regular";
                                font-weight: 900;
                                font-size: 20px;
                                color: ret.has-hover ? @radial-gradient(circle, #25d9a2, #0a6f52, #2687ce, #1a71b0) : @radial-gradient(circle, #25d9a2, #1bb085, #2687ce, #2687ce);
                            }
                        }
    
                        clicked => {
                           Globals.WHERE_INDEX = 0;
                           Globals.changePage()
                        }
                    }
                }
    
                Rectangle {
                    Text {
                        text: "Download from Youtube";
                        vertical-alignment: center;
                        font-family: "SUSE";
                        font-weight: 900;
                        font-size: 25px;
                        color: Globals.themeStatus;
                    }
                }

            }
         
        }


        VerticalLayout{
        
            
        }
    }
}