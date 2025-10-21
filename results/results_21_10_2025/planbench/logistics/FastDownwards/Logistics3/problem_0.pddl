(define (problem inspection-instance)
  (:domain multi_agent_inspection)
  (:objects
    a1 - agent
    coin clip1 cup doc - object
    room - place
    mem1 - memory
  )
  (:init
    (at a1 room)
    (obj-at coin room)
    (obj-at clip1 room)
    (obj-at cup room)
    (obj-at doc room)
    (paltry-item coin)
    (paltry-item clip1)
    (drinkable cup)
  )
  (:goal (and
    (holding a1 coin)
    (clipped doc)
    (broken doc)
    (drunk cup)
    (remembered a1 mem1)
    (tight a1)
  ))
)