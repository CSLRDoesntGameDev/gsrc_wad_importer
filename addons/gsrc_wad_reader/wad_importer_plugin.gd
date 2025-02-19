@tool
extends EditorImportPlugin
class_name WADImporterPlugin


func _get_importer_name(): return "GoldSRC WAD Reader"

func _get_visible_name(): return "WAD"

func _get_recognized_extensions(): return ["wad"]

func _get_priority(): return 1.0

func _get_import_order(): return 0

func _get_save_extension(): return "scn"

func _get_resource_type(): return "PackedScene"

func _get_preset_count() -> int: return 0

func _get_import_options(path: String, preset_index: int) -> Array[Dictionary]:  return [{"name": "dummy", "default_value": false}]

func _get_option_visibility(path: String, option_name: StringName, options: Dictionary) -> bool: return false

func _can_import_threaded(): return false

func _import(source_file, save_path, options, platform_variants, gen_file):
	
	var reader := WADReader.new()
	reader.read_wad(source_file)
	
	var n = Node.new()
	var ps = PackedScene.new()
	ps.pack(n)
	return ResourceSaver.save(ps, "%s.%s" % [save_path, _get_save_extension()])
