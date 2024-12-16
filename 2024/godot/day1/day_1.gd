class_name Day1
extends Node


# Go to the link and create PuzzleInput resources for your input: https://adventofcode.com/2024/day/1
@export_category("Input Resources")
@export var sample_input: PuzzleInput
@export var puzzle_input: PuzzleInput

@export_category("Flow")
@export var selected_input: InputType
@export var selected_puzzle: Puzzle

enum InputType {SAMPLE, PUZZLE}
enum Puzzle {PART1, PART2}

var list_1: Array[int]
var list_2: Array[int]

const InputDelimiter : String = "   "


func _ready() -> void:
	match selected_input:
		InputType.SAMPLE:
			_parse_input(sample_input.text)
		InputType.PUZZLE:
			_parse_input(puzzle_input.text)
	
	match selected_puzzle:
		Puzzle.PART1:
			_process_list_part1()
		Puzzle.PART2:
			_process_list_part2()


func _parse_input(input: String):
	var text_array: PackedStringArray = input.split("\n")
	for line in text_array:
		var split_line: PackedStringArray = line.split(InputDelimiter)
		list_1.append(int(split_line[0]))
		list_2.append(int(split_line[1]))
	
	list_1.sort()
	list_2.sort()


func _process_list_part1():
	var total = 0
	for i in range(list_1.size()):
		total += absi(list_1[i] - list_2[i])
	
	print(total)
	pass


func _process_list_part2():
	var total = 0
	
	var occurances: Dictionary
	
	for i in list_2:
		if occurances.has(i):
			occurances[i] += 1
		else:
			occurances[i] = 1
	
	for i in list_1:
		if occurances.has(i):
			total += i * occurances[i]

	print(total)
	pass
