(define (problem find-meeting-time)
  (:domain combined-scheduling)

  (:objects
    9-10 10-11 11-12 12-13 13-14 14-15 15-16 16-17 - time_slot
  )

  (:init
    (free-agent1 9-10)
    (free-agent1 10-11)
    (not (free-agent1 11-12))
    (free-agent1 12-13)
    (free-agent1 13-14)
    (free-agent1 14-15)
    (free-agent1 15-16)
    (free-agent1 16-17)

    (free-agent2 9-10)
    (free-agent2 10-11)
    (not (free-agent2 11-12))
    (free-agent2 12-13)
    (not (free-agent2 13-14))
    (free-agent2 14-15)
    (not (free-agent2 15-16))
    (free-agent2 16-17)

    (free-agent3 9-10)
    (not (free-agent3 10-11))
    (free-agent3 11-12)
    (free-agent3 12-13)
    (not (free-agent3 13-14))
    (free-agent3 14-15)
    (not (free-agent3 15-16))
    (not (free-agent3 16-17))

    (not (meeting-scheduled))
  )

  (:goal
    (meeting-scheduled)
  )
)