//map a value from one range to another
//sourced from here: https://forum.gamemaker.io/index.php?threads/map_value-remap-values-from-one-range-to-another.59699/
function MapValue(_value, _current_lower_bound, _current_upper_bound, _desired_lowered_bound, _desired_upper_bound) {
    return (((_value - _current_lower_bound) / (_current_upper_bound - _current_lower_bound)) * (_desired_upper_bound - _desired_lowered_bound)) + _desired_lowered_bound;
}