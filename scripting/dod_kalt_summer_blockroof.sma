#include <amxmodx>
#include <engine>
#include <fakemeta>
#include <engine>

#define MODEL "models/mapmodels/null.mdl"

public plugin_precache()
{
	precache_model(MODEL)
}

public plugin_init()
{
	register_plugin("dod_kalt_summer block roof access", "1.0", "Fysiks")

	// Blocks getting under the railing of the balcony to the left of Allies spawn from top of building
	create_wall(Float:{1410.0, 1200.0, 22.0}, Float:{-120.0, -5.0, -20.0}, Float:{160.0, 5.0, 20.0})
}

stock create_wall(Float:fvOrigin[3], Float:mins[3], Float:maxs[3])
{
	// Doesn't seem to work so far.
	new entMyWall = create_entity("func_wall")
	entity_set_string(entMyWall, EV_SZ_classname, "wall")
	entity_set_model(entMyWall, MODEL)

	// Set size and absmin+absmax values
	entity_set_vector(entMyWall, EV_VEC_mins, mins)
	entity_set_vector(entMyWall, EV_VEC_absmin, mins)

	entity_set_vector(entMyWall, EV_VEC_maxs, maxs)
	entity_set_vector(entMyWall, EV_VEC_absmax, maxs)

	// Set angle
	mins[0] = 0.0
	mins[1] = 0.0
	mins[2] = 0.0
	entity_set_vector(entMyWall, EV_VEC_angles, Float:{0.0,0.0,0.0})

	// Get user origin
	entity_set_origin(entMyWall, fvOrigin)

	// Set other values
	entity_set_int(entMyWall, EV_INT_solid, SOLID_BBOX)
	entity_set_int(entMyWall, EV_INT_movetype, MOVETYPE_FLY)

	return entMyWall
}
