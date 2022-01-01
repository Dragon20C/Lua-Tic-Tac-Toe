
local board_data = {top_L= " ", top_M = " ", top_R= " ", mid_L= " ", mid_M= " ", mid_R= " ", low_L= " ", low_M= " ",
low_R= " "}

local location = {"top","mid","low"}
local position = {"_L","_M","_R"}

local function _draw_board() -- Draws the games table
    print(
    board_data["top_L"].."┃"..board_data["top_M"].."┃"..board_data["top_R"].."\n"..
    "------\n"..
    board_data["mid_L"].."┃"..board_data["mid_M"].."┃"..board_data["mid_R"].."\n"..
    "------\n"..
    board_data["low_L"].."┃"..board_data["low_M"].."┃"..board_data["low_R"].."\n"
    )   
end

local function _check_if_position_exists_and_is_empty(_input) -- Checks if the user has entered a valid position and that it is empty
    return board_data[_input] == " "
end

local function _check_win_condition(current_turn) --Checks if the current player has won
    for i = 1, 3 do
        if board_data[location[i]..position[1]] == current_turn and board_data[location[i]..position[2]] == current_turn and board_data[location[i]..position[3]] == current_turn then
            return true
        elseif board_data[location[1]..position[i]] == current_turn and board_data[location[2]..position[i]] == current_turn and board_data[location[3]..position[i]] == current_turn then
            return true
        elseif board_data[location[1]..position[1]] == current_turn and board_data[location[2]..position[2]] == current_turn and board_data[location[3]..position[3]] == current_turn then
            return true
        elseif board_data[location[3]..position[1]] == current_turn and board_data[location[2]..position[2]] == current_turn and board_data[location[1]..position[3]] == current_turn then
            return true
        end
    end
end

local function check_tie_condition()
    local is_not_empty = 0
    for i = 1,3 do
        if board_data[location[i]..position[1]] ~= " " and board_data[location[i]..position[2]] ~= " " and board_data[location[i]..position[3]] ~= " " then
            is_not_empty = is_not_empty + 3
        end
    if is_not_empty == 9 then
        return true
    end
    end
end

local function _game() --The main loop of the game
    local current_turn = "X" -- it holds two states X or O
    print("Please select a position from the board, to access the top row, type top_position position being L, M , R e.g top_L \n")
    _draw_board()
    while true do
        print("Player " ..current_turn.. " is selected!")
        local Input = io.read()
        if _check_if_position_exists_and_is_empty(Input) then
            board_data[Input] = current_turn
            _draw_board()
            if _check_win_condition(current_turn) then
                print("Player "..current_turn .. " Has won this game!")
                break
            elseif check_tie_condition() then
                print("The game has ended at a tie!")
                break
            end
            if current_turn == "X" then -- Switch to the other player
                current_turn = "O"
            elseif current_turn == "O" then
                current_turn = "X"
            end
            
        else
            print("\nThat wasnt a command in the table or the slot wasnt empty!, example top_L, mid_R, low_M \n")
        end
    end
end

_game()
