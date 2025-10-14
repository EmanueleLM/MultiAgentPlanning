(define (domain multi_agent_domain)
  (:requirements :strips :typing)
  (:types agent timeslot room meeting)

  (:predicates
    (agent ?a - agent)
    (timeslot ?t - timeslot)
    (room ?r - room)
    (meeting ?m - meeting)
    (free ?t - timeslot)                        ; timeslot currently available
    (room-available ?r - room)                 ; room currently available
    (proposal ?m - meeting ?t - timeslot)      ; meeting proposed for a timeslot
    (participant ?m - meeting ?a - agent)      ; agent is required participant for meeting
    (confirmed ?m - meeting ?a - agent)        ; agent has been confirmed for meeting
    (scheduled ?m - meeting ?t - timeslot)     ; meeting scheduled at timeslot
    (reserved ?r - room ?t - timeslot)         ; room reserved at timeslot
  )

  ; Analyzer 1: proposes a meeting time (does not consume the slot)
  (:action analyzer1_propose_meeting
    :parameters (?m - meeting ?t - timeslot ?a - agent)
    :precondition (and
      (meeting ?m)
      (timeslot ?t)
      (agent ?a)
      (free ?t)
    )
    :effect (and
      (proposal ?m ?t)
    )
  )

  ; Analyzer 2: confirms meeting for two required participants and reserves a room
  ; Note: action parameters include the two participants explicitly so the constraint
  ; that both required participants be confirmed is encoded as a hard precondition.
  (:action analyzer2_confirm_meeting
    :parameters (?m - meeting ?a1 - agent ?a2 - agent ?t - timeslot ?r - room)
    :precondition (and
      (meeting ?m)
      (participant ?m ?a1)
      (participant ?m ?a2)
      (timeslot ?t)
      (proposal ?m ?t)
      (free ?t)
      (room ?r)
      (room-available ?r)
    )
    :effect (and
      (confirmed ?m ?a1)
      (confirmed ?m ?a2)
      (scheduled ?m ?t)
      (reserved ?r ?t)
      (not (free ?t))
      (not (room-available ?r))
    )
  )

  ; Public action: reserve a room at a free timeslot (alternative path)
  (:action public_reserve_room
    :parameters (?r - room ?t - timeslot)
    :precondition (and
      (room ?r)
      (timeslot ?t)
      (free ?t)
      (room-available ?r)
    )
    :effect (and
      (reserved ?r ?t)
      (not (free ?t))
      (not (room-available ?r))
    )
  )
)