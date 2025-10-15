(define (problem multi_agent_problem)
  (:domain multi_agent_domain)

  (:objects
    object_0 object_1 - agent
    object_2 object_3 object_4 object_5 - timeslot
    object_6 object_7 object_8 - room
    object_9 - meeting
    object_10 object_11 object_12 object_13 - agent  ; extra agents available if needed
  )

  (:init
    ; agents
    (agent object_0)
    (agent object_1)
    (agent object_10)
    (agent object_11)
    (agent object_12)
    (agent object_13)

    ; timeslots (object_2 is the earliest slot)
    (timeslot object_2)
    (timeslot object_3)
    (timeslot object_4)
    (timeslot object_5)

    ; rooms
    (room object_6)
    (room object_7)
    (room object_8)

    ; meeting to be scheduled
    (meeting object_9)

    ; participants required by the meeting (hard constraints)
    (participant object_9 object_0)
    (participant object_9 object_1)

    ; availability: only the earliest allowed slot is free (hard temporal constraint)
    (free object_2)

    ; only room object_6 is available (ensures earliest feasible room choice)
    (room-available object_6)
  )

  (:goal (and
    ; Meeting must be scheduled at the earliest slot and both participants confirmed,
    ; and the chosen room must be reserved at that same earliest time.
    (scheduled object_9 object_2)
    (reserved object_6 object_2)
    (confirmed object_9 object_0)
    (confirmed object_9 object_1)
  ))
)