(define (problem find-meeting-time)
  (:domain combined-scheduling)

  (:objects
    slot9-10 slot10-11 slot11-12 slot12-13 slot13-14 slot14-15 slot15-16 slot16-17 - time_slot
  )

  (:init
    (free-agent1 slot9-10)
    (free-agent1 slot10-11)
    (not (free-agent1 slot11-12))
    (free-agent1 slot12-13)
    (free-agent1 slot13-14)
    (free-agent1 slot14-15)
    (free-agent1 slot15-16)
    (free-agent1 slot16-17)

    (free-agent2 slot9-10)
    (free-agent2 slot10-11)
    (not (free-agent2 slot11-12))
    (free-agent2 slot12-13)
    (not (free-agent2 slot13-14))
    (free-agent2 slot14-15)
    (not (free-agent2 slot15-16))
    (free-agent2 slot16-17)

    (free-agent3 slot9-10)
    (not (free-agent3 slot10-11))
    (free-agent3 slot11-12)
    (free-agent3 slot12-13)
    (not (free-agent3 slot13-14))
    (free-agent3 slot14-15)
    (not (free-agent3 slot15-16))
    (not (free-agent3 slot16-17))

    (not (meeting-scheduled))
  )

  (:goal
    (meeting-scheduled)
  )
)