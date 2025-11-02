(define (problem set_next_objects)
  (:domain social_actions)

  (:objects
    agent1 - agent
    object_5 object_7 object_8 - object
    item1 - item
    target1 - target
    consumable1 - consumable
    container1 - container
    entity1 - entity
    info1 - info
  )

  (:init
    ;; Example initial facts consistent with the domain capabilities.
    (holds agent1 item1)
    (attachable item1 target1)
    (consumable consumable1)
    ;; Note: empty is intentionally not present for consumable1 (it is non-empty).
    ;; No 'next' facts are true initially; the goal requires establishing them.
  )

  (:goal (and
    (next object_7 object_5)
    (next object_8 object_5)
  ))
)