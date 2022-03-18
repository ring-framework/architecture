browser_api_adapter_container = container "Browser API Adapter" {
    technology "Rust compiled to WASM + TypeScript compiled to JavaScript"
    url "https://github.com/ring-framework/browser-api-adapter"
    description "Web API service"

    browser_api_adapter_container -> web_browser_system "Listens for user and browser events"
    web_browser_system -> browser_api_adapter_container "Provides API for browser interaction"
}
