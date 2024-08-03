slint::slint! {
    import { VerticalBox } from "std-widgets.slint";

    export global CalcLogic {
        callback button-pressed(string);
    }

    component Button {
        in property <string> text;
        Rectangle {
            background: ta.pressed ? #747e88 : ta.has-hover ? #3cbf7b : teal;
            animate background { duration: 150ms; }
            border-radius: 4px;
            border-width: 2px;
            border-color: self.background.darker(20%);
            ta := TouchArea {
                clicked => {
                    CalcLogic.button-pressed(root.text);
                }
            }
        }
        Text { text: root.text; color: whitesmoke;}
    }
    
    export component App inherits Window{

        in property <int> counter: 1;
    
        GridLayout {
            padding: 10px;
            spacing: 10px;
            Text {
                text: counter; 
                colspan: 3;
            }
            Row{
                Button{text: "1";}
                Button{text: "2";}
                Button{text: "3";}
            }
            Row{
                Button{text: "4";}
                Button{text: "5";}
                Button{text: "6";}
            }
            Row{
                Button{text: "7";}
                Button{text: "8";}
                Button{text: "9";}
            }
            Row{
                Button{text: "0";}
            }
        }
    }
}

fn main() {
    let app = App::new().unwrap();
    let weak = app.as_weak();

    app.global::<CalcLogic>().on_button_pressed(moved | value | {
        let app = weak.unwrap();
        app.set_value(value.parse().unwrap());
    },
);
    
    app.run().unwrap();
    println!("Hello, world!");
}
