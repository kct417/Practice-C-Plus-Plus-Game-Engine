#pragma once

#ifdef GE_PLATFORM_WINDOWS

extern Engine::Application *Engine::CreateApplication();

int main()
{
    Engine::Log::Init();
    GE_CORE_WARN("Core Logger");
    GE_INFO("Client Logger");

    auto app = Engine::CreateApplication();
    app->Run();
    delete app;
}

#endif
