#pragma once

#include "Base.h"
#include "Window.h"

namespace Engine
{

    class ENGINE_API Application
    {
    public:
        Application();
        virtual ~Application();

        void Run();

    private:
        std::unique_ptr<Window> m_Window;
        bool m_Running = true;
    };

    Application *CreateApplication();
}
