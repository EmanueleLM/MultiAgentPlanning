(define (domain integrated-meeting-domain)
  (:requirements :typing :negative-preconditions :equality :action-costs :adl)
  (:types person location timepoint)

  (:predicates
    (at-visitor ?l - location)
    (at-agent ?l - location)
    (at-person ?p - person ?l - location)
    (met ?p - person)
    (at-time ?t - timepoint)

    ;; symbolic relations representing time arithmetic / ordering
    (next16 ?t1 - timepoint ?t2 - timepoint)
    (next15 ?t1 - timepoint ?t2 - timepoint)
    (plus90 ?t1 - timepoint ?t2 - timepoint)
    (before1080 ?t - timepoint)
    (in-start-window ?t - timepoint)
  )

  ;; Visitor travels NB -> Alamo (16 minutes)
  (:action visitor-travel-nb-to-alamo
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at-visitor north-beach)
      (at-time ?t1)
      (next16 ?t1 ?t2)
    )
    :effect (and
      (not (at-visitor north-beach))
      (at-visitor alamo-square)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 16
  )

  ;; Visitor travels Alamo -> NB (15 minutes)
  (:action visitor-travel-alamo-to-nb
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at-visitor alamo-square)
      (at-time ?t1)
      (next15 ?t1 ?t2)
    )
    :effect (and
      (not (at-visitor alamo-square))
      (at-visitor north-beach)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 15
  )

  ;; Planner/agent travels NB -> Alamo (16 minutes)
  (:action agent-travel-northbeach-to-alamosquare
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at-agent north-beach)
      (at-time ?t1)
      (next16 ?t1 ?t2)
    )
    :effect (and
      (not (at-agent north-beach))
      (at-agent alamo-square)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 16
  )

  ;; Planner/agent travels Alamo -> NB (15 minutes)
  (:action agent-travel-alamosquare-to-northbeach
    :parameters (?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (at-agent alamo-square)
      (at-time ?t1)
      (next15 ?t1 ?t2)
    )
    :effect (and
      (not (at-agent alamo-square))
      (at-agent north-beach)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 15
  )

  ;; Wait/fast-forward to 18:00 (t1080) if before 1080
  (:action wait-to-1080
    :parameters (?t - timepoint)
    :precondition (and
      (at-time ?t)
      (before1080 ?t)
    )
    :effect (and
      (not (at-time ?t))
      (at-time t1080)
    )
    :cost 0
  )

  ;; Visitor-initiated meeting with Barbara for 90 minutes (simulated via timepoints)
  (:action visitor-meet-barbara
    :parameters (?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (at-visitor alamo-square)
      (at-agent alamo-square)
      (at-person barbara alamo-square)
      (not (met barbara))
      (at-time ?tstart)
      (in-start-window ?tstart)
      (plus90 ?tstart ?tend)
    )
    :effect (and
      (met barbara)
      (not (at-time ?tstart))
      (at-time ?tend)
    )
    :cost 0
  )

  ;; Agent-initiated meeting with Barbara for 90 minutes (simulated via timepoints)
  (:action agent-meet-with-barbara
    :parameters (?tstart - timepoint ?tend - timepoint)
    :precondition (and
      (at-agent alamo-square)
      (at-visitor alamo-square)
      (at-person barbara alamo-square)
      (not (met barbara))
      (at-time ?tstart)
      (in-start-window ?tstart)
      (plus90 ?tstart ?tend)
    )
    :effect (and
      (met barbara)
      (not (at-time ?tstart))
      (at-time ?tend)
    )
    :cost 0
  )
)