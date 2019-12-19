-- Menu configuration, array of menus to display
menuConfigs = {
    ['menu'] = {
        enableMenu = function()
            return true
        end,
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.3 },
                    hover = { ['fill'] = '#dd4efc', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.80},
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:mec.png", "imgsrc:yo.png", "imgsrc:wesh.png", "imgsrc:voiture.png", "imgsrc:what.png"},
                    commands = {"submenu1", "submenu2", "phonexenon", "submenu4", "submenu5"}
                }
            }
        }
    }
}

-- Submenu configuration
subMenuConfigs = {
    ['submenu1'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.3 },
                    hover = { ['fill'] = '#dd4efc', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:mec.png", "imgsrc:yo.png", "imgsrc:wesh.png", "imgsrc:voiture.png", "imgsrc:what.png"},
                    commands = {"submenu1", "submenu2", "phonexenon", "submenu4", "submenu5"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"imgsrc:piggy.png", "imgsrc:otage.png"},
                    commands = {"piggyback", "takehostage"}
                }
            }
        }
    },
    ['submenu2'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.30 },
                    hover = { ['fill'] = '#dd4efc', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.30 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:mec.png", "imgsrc:yo.png", "imgsrc:wesh.png", "imgsrc:voiture.png", "imgsrc:what.png"},
                    commands = {"submenu1", "submenu2", "phonexenon", "submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"imgsrc:haut.png", "imgsrc:pants.png", "imgsrc:shoes.png", "imgsrc:bag.png", "imgsrc:tabac.png", "imgsrc:joint.png", "imgsrc:cigar.png", "imgsrc:helmet.png", "imgsrc:glasses.png"},
                    commands = {"torso", "pants", "shoes", "bag", "cigarette", "joint", "cigar", "helmet", "glasses"}
                }
            }
        }
    },
    ['submenu3'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.30 },
                    hover = { ['fill'] = '#dd4efc', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.30 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:mec.png", "imgsrc:yo.png", "imgsrc:wesh.png", "imgsrc:what.png", "imgsrc:what.png"},
                    commands = {"submenu1", "submenu2", "phonexenon", "submenu4", "submenu5"}
                },
            
            }
        }
    },
    ['submenu4'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.30 },
                    hover = { ['fill'] = '#dd4efc', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.30 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:mec.png", "imgsrc:yo.png", "imgsrc:wesh.png", "imgsrc:voiture.png", "imgsrc:what.png"},
                    commands = {"submenu1", "submenu2", "phonexenon", "submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"imgsrc:engine.png", "imgsrc:trunk.png", "imgsrc:hood.png", "imgsrc:doors.png"},
                    commands = {"engine", "trunk", "hood", "rdoors"}
                }
            }
        }
    },
    ['submenu5'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.30 },
                    hover = { ['fill'] = '#dd4efc', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.30 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:mec.png", "imgsrc:yo.png", "imgsrc:wesh.png", "imgsrc:voiture.png", "imgsrc:what.png"},
                    commands = {"submenu1", "submenu2", "phonexenon", "submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"Violence", "Urgence", "Question", "Ban", "Demande", "Aide", "Bug"},
                    commands = {"report freekill", "report C'est une urgence !", "report J'ai une question", "report Je voudrais parler d'un ban", "report Je voudrais vous faire une demande", "report J'ai besoin d'aide", "report j'ai trouvé un bug"}
                }
            }
        }
    },
}
