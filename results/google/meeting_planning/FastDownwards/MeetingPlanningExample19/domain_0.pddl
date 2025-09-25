(define (domain multi-agent-meeting)
  (:requirements :strips :typing :fluents)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (john-available ?l - location)
    (visitor-wants-meet ?v - agent ?j - agent)
    (met ?v - agent ?j - agent)
  )

  (:functions
    (time)                ; global clock in minutes (informational / can be used for optimization)
    (meeting-duration)    ; accumulated meeting minutes between visitor and john
  )

  ;; Visitor travel actions (distinct agent actions)
  (:action visitor-travel-ggp-to-ph
    :parameters ()
    :precondition (and (at visitor ggp))
    :effect (and
      (not (at visitor ggp))
      (at visitor ph)
      (increase (time) 16)        ; travel time from Golden Gate Park to Pacific Heights = 16
    )
  )

  (:action visitor-travel-ph-to-ggp
    :parameters ()
    :precondition (and (at visitor ph))
    :effect (and
      (not (at visitor ph))
      (at visitor ggp)
      (increase (time) 15)        ; travel time from Pacific Heights to Golden Gate Park = 15
    )
  )

  ;; Visitor initiates meeting (distinct action for visitor)
  (:action visitor-start-meeting
    :parameters ()
    :precondition (and
      (at visitor ph)
      (at john ph)
      (john-available ph)
      (not (visitor-wants-meet visitor john))
    )
    :effect (and
      (visitor-wants-meet visitor john)
    )
  )

  ;; John's distinct action to accept / join the meeting and thereby realize 45 minutes
  ;; This models the joint meeting by requiring both roles to act (actions remain distinct per agent)
  (:action john-accept-meeting
    :parameters ()
    :precondition (and
      (at john ph)
      (at visitor ph)
      (john-available ph)
      (visitor-wants-meet visitor john)
    )
    :effect (and
      (not (visitor-wants-meet visitor john))
      (met visitor john)
      (increase (meeting-duration) 45)  ; meeting lasts at least 45 minutes
    )
  )

  ;; Optional: John can move (kept distinct) if needed later (no travel times beyond known window provided here)
  (:action john-travel-ph-to-ggp
    :parameters ()
    :precondition (and (at john ph))
    :effect (and
      (not (at john ph))
      (at john ggp)
      (increase (time) 15)
    )
  )

  (:action john-travel-ggp-to-ph
    :parameters ()
    :precondition (and (at john ggp))
    :effect (and
      (not (at john ggp))
      (at john ph)
      (increase (time) 16)
    )
  )
)