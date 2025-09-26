(define (domain meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions :fluents)
  (:types person slot)
  (:predicates
    (slot ?s - slot)
    (person ?p - person)
    (available ?p - person ?s - slot)
    (within-cutoff ?s - slot)           ; slots Charlotte allows (<= 13:30)
    (scheduled)
    (scheduled-at ?s - slot)
  )
  (:functions
    (start-time)  ; numeric fluent holding the chosen slot index (lower = earlier)
  )

  ; Schedule actions for all slots that respect Charlotte's hard cutoff (<= 13:30).
  ; Each action requires all participants be available at that slot and that no meeting is yet scheduled.
  ; Effect marks the meeting scheduled at that slot and assigns start-time to the slot index.
  (:action schedule-s0
    :parameters ()
    :precondition (and (slot s0) (available kathryn s0) (available charlotte s0) (available lauren s0) (not (scheduled)) (within-cutoff s0))
    :effect (and (scheduled) (scheduled-at s0) (assign (start-time) 0))
  )
  (:action schedule-s1
    :parameters ()
    :precondition (and (slot s1) (available kathryn s1) (available charlotte s1) (available lauren s1) (not (scheduled)) (within-cutoff s1))
    :effect (and (scheduled) (scheduled-at s1) (assign (start-time) 1))
  )
  (:action schedule-s2
    :parameters ()
    :precondition (and (slot s2) (available kathryn s2) (available charlotte s2) (available lauren s2) (not (scheduled)) (within-cutoff s2))
    :effect (and (scheduled) (scheduled-at s2) (assign (start-time) 2))
  )
  (:action schedule-s3
    :parameters ()
    :precondition (and (slot s3) (available kathryn s3) (available charlotte s3) (available lauren s3) (not (scheduled)) (within-cutoff s3))
    :effect (and (scheduled) (scheduled-at s3) (assign (start-time) 3))
  )
  (:action schedule-s4
    :parameters ()
    :precondition (and (slot s4) (available kathryn s4) (available charlotte s4) (available lauren s4) (not (scheduled)) (within-cutoff s4))
    :effect (and (scheduled) (scheduled-at s4) (assign (start-time) 4))
  )
  (:action schedule-s5
    :parameters ()
    :precondition (and (slot s5) (available kathryn s5) (available charlotte s5) (available lauren s5) (not (scheduled)) (within-cutoff s5))
    :effect (and (scheduled) (scheduled-at s5) (assign (start-time) 5))
  )
  (:action schedule-s6
    :parameters ()
    :precondition (and (slot s6) (available kathryn s6) (available charlotte s6) (available lauren s6) (not (scheduled)) (within-cutoff s6))
    :effect (and (scheduled) (scheduled-at s6) (assign (start-time) 6))
  )
  (:action schedule-s7
    :parameters ()
    :precondition (and (slot s7) (available kathryn s7) (available charlotte s7) (available lauren s7) (not (scheduled)) (within-cutoff s7))
    :effect (and (scheduled) (scheduled-at s7) (assign (start-time) 7))
  )
  (:action schedule-s8
    :parameters ()
    :precondition (and (slot s8) (available kathryn s8) (available charlotte s8) (available lauren s8) (not (scheduled)) (within-cutoff s8))
    :effect (and (scheduled) (scheduled-at s8) (assign (start-time) 8))
  )
  (:action schedule-s9
    :parameters ()
    :precondition (and (slot s9) (available kathryn s9) (available charlotte s9) (available lauren s9) (not (scheduled)) (within-cutoff s9))
    :effect (and (scheduled) (scheduled-at s9) (assign (start-time) 9))
  )
)