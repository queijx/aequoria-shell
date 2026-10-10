hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })


hl.curve("suspension",     { type = "spring", mass = 1,   stiffness = 200, dampening = 25 })
hl.curve("boioioing",      { type = "spring", mass = 0.7, stiffness = 200, dampening = 10 })
hl.curve("fast",           { type = "spring", mass = 1,   stiffness = 500, dampening = 32 })


hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1,    spring = "suspension", style = "slidevert" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 1,    spring = "fast" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 1,    bezier = "easeOutQuint" })

hl.animation({ leaf = "fade",          enabled = true,  speed = 3,    bezier = "quick" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5,    bezier = "easeOutQuint" })

hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1,    spring = "suspension",   style = "slidevert" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1,    spring = "suspension",   style = "slidevert" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 1,    spring = "fast",         style = "popin 28%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1,    bezier = "linear",       style = "popin 67%" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 1,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1,    bezier = "linear",       style = "fade" })

hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1,    bezier = "almostLinear" })

hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1,    bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1,    bezier = "almostLinear" })

hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })