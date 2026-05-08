(define (problem assemble_network)
  (:domain sequence_domain)

  (:objects
    agent1 agent2 - agent
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
  )

  (:init
    ; Permissions: only these specific links are permitted, assigned to agents.
    (allow-link-for agent1 object_10 object_8)
    (allow-link-for agent1 object_11 object_7)
    (allow-link-for agent2 object_9 object_6)

    ; Note: no has-next/has-prev initial facts are asserted here, matching the
    ; intended ability to create the target links via the permitted actions.
  )

  (:goal
    (and
      (next object_10 object_8)
      (has-next object_10)
      (has-prev object_8)

      (next object_11 object_7)
      (has-next object_11)
      (has-prev object_7)

      (next object_9 object_6)
      (has-next object_9)
      (has-prev object_6)
    )
  )
)