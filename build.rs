const MAIN_WINDOW: &str = "ui/welcome.slint";

fn main(){
    slint_build::compile_with_config(
        MAIN_WINDOW,
        slint_build::CompilerConfiguration::new().with_library_paths(vivi_ui::import_paths()),
    ).unwrap();
}
