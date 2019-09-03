module ANYmalRobot

using RigidBodyDynamics

packagepath() = joinpath(@__DIR__, "..")
urdfpath() = joinpath(packagepath(), "anymal_b_simple_description/urdf/anymal.urdf")

function mechanism(::Type{T} = Float64;
                   floating = true,
                   # contactmodel = default_contact_model(),
                   remove_fixed_tree_joints = true, add_flat_ground = false) where {T}
    mechanism = RigidBodyDynamics.parse_urdf(urdfpath(); scalar_type = T, floating = floating, remove_fixed_tree_joints = remove_fixed_tree_joints)

    remove_fixed_tree_joints && remove_fixed_tree_joints!(mechanism)

    return mechanism
end

end # module
