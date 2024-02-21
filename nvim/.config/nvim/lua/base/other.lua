--[[ Переменные ]]--
-- Переменная для настройки опций Neovim
-- Все время использовать vim.opt - не удобно, поэтому сделаем алиас
local opt = vim.opt

-- Глобальные переменные
-- То же самое делаем и с vim.global
local g = vim.g

--[[ Настройка панелей ]]--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
opt.splitright = true

-- Горизонтальные сплиты становятся снизу
opt.splitbelow = true

--[[ Дополнительные настройки ]]--
-- Используем системный буфер обмена
opt.clipboard = 'unnamedplus'

-- Отключаем дополнение файлов в конце
opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
opt.completeopt = 'menuone,noselect'

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Нумерация строк
opt.number = true

-- Включает относительную нумерацию
opt.relativenumber = true

-- Подстветка строки под курсором
opt.cursorline = true

-- Включает 256 цветов
opt.termguicolors = true

-- Выделение вертикальной строки ограничения
vim.api.nvim_set_option_value("colorcolumn", "79", {})

-- Подключения проверки синтаксиса
opt.spelllang = { 'en_ru', 'ru' }

vim.cmd[[colorscheme dracula]]
