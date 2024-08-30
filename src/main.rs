use std::{cell::RefCell, rc::Rc, process::Command};
use slint::ComponentHandle;
slint::include_modules!();

// use slint::slint;

// slint! {
//     import { VerticalBox } from "std-widgets.slint";

//     export global CalcLogic {
//         callback button_pressed(string);
//     }

//     component Button {
//         in property <string> text;
//         min-height: 30px;
//         min-width: 30px;
//         in property <brush> background: teal;
//         Rectangle {
//             background: ta.pressed ? #747e88 : ta.has-hover ? background.brighter(10%) : background;
//             animate background { duration: 150ms; }
//             border-radius: 4px;
//             border-width: 2px;
//             border-color: self.background.darker(20%);
//             ta := TouchArea {
//                 clicked => {
//                     CalcLogic.button_pressed(root.text);
//                 }
//             }
//         }
//         Text { text: root.text; color: whitesmoke;}
//     }
    
//     export component App inherits Window {

//         in property <int> value: 0;
    
//         GridLayout {
//             padding: 10px;
//             spacing: 10px;
//             Text {
//                 text: value; 
//                 colspan: 3;
//             }
//             Row{
//                 Button { text: "1"; }
//                 Button { text: "2"; }
//                 Button { text: "3"; }
//                 Button { text: "+"; background: gray; }
//             }
//             Row{
//                 Button { text: "4"; }
//                 Button { text: "5"; }
//                 Button { text: "6"; }
//                 Button { text: "-"; background: gray; }
//             }
//             Row{
//                 Button { text: "7"; }
//                 Button { text: "8"; }
//                 Button { text: "9"; }
//                 Button { text: "*"; background: gray; }
//             }
//             Row{
//                 Button { text: "0"; }
//                 Button {
//                     text: "=";
//                     col: 2;
//                     background: @linear-gradient(-20deg, #b38fae, #a365e3);
//                 }
//                 Button { text: "/"; background: gray; }
//             }
//         }
//     }
// }

#[derive(Default)]
struct CalcState {
    prev_value: i32,
    current_value: i32,
    operator: Option<slint::SharedString>,
}

fn main() {
    let app = App::new().unwrap();
    let weak = app.as_weak();
    let state = Rc::new(RefCell::new(CalcState::default()));

    app.global::<CalcLogic>().on_button_pressed(move |value| {
        let app = weak.unwrap();
        let mut state = state.borrow_mut();

        if let Ok(val) = value.parse::<i32>() {
            state.current_value *= 10;
            state.current_value += val;
            app.set_value(state.current_value);
        } else if value.as_str() == "=" {
            if let Some(operator) = &state.operator {
                let result = match operator.as_str() {
                    "+" => state.prev_value + state.current_value,
                    "-" => state.prev_value - state.current_value,
                    "*" => state.prev_value * state.current_value,
                    "/" => state.prev_value / state.current_value,
                    _ => return,
                };
                app.set_value(result);
                state.current_value = 0;
                state.prev_value = result;
                state.operator = None;
            }
        } else {
            if state.operator.is_some() {
                let result = match state.operator.as_ref().unwrap().as_str() {
                    "+" => state.prev_value + state.current_value,
                    "-" => state.prev_value - state.current_value,
                    "*" => state.prev_value * state.current_value,
                    "/" => state.prev_value / state.current_value,
                    _ => return,
                };
                state.prev_value = result;
            } else {
                state.prev_value = state.current_value;
            }
            state.current_value = 0;
            state.operator = Some(value.clone());
        }
    });

    app.run().unwrap();
    println!("Hello, world!");
}
    // https://blog.ashutoshkrris.in/how-to-download-youtube-playlist-using-python
//tracing = "0.1"
//libloading = "0.7"

