MarbleApp::Application.routes.draw do
  match 'with_extension' => 'test#with_extension'
  match 'without_extension' => 'test#without_extension'
end