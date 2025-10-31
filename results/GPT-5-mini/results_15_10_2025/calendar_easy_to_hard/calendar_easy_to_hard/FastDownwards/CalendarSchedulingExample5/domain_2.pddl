(define (domain meeting-scheduling)
  (:requirements :typing :strips :negative-preconditions :fluents)
  (:types person slot)
  (:predicates
    (is-slot ?s - slot)
    (available ?p - person ?s - slot)
    (within-cutoff ?s - slot)
    (scheduled)
    (scheduled-at ?s - slot)
  )
  (:functions (total-cost))

  (:action schedule-s0
    :parameters ()
    :precondition (and (is-slot s0) (available kathryn s0) (available charlotte s0) (available lauren s0) (not (scheduled)) (within-cutoff s0))
    :effect (and (scheduled) (scheduled-at s0) (increase (total-cost) 0))
  )
  (:action schedule-s1
    :parameters ()
    :precondition (and (is-slot s1) (available kathryn s1) (available charlotte s1) (available lauren s1) (not (scheduled)) (within-cutoff s1))
    :effect (and (scheduled) (scheduled-at s1) (increase (total-cost) 1))
  )
  (:action schedule-s2
    :parameters ()
    :precondition (and (is-slot s2) (available kathryn s2) (available charlotte s2) (available lauren s2) (not (scheduled)) (within-cutoff s2))
    :effect (and (scheduled) (scheduled-at s2) (increase (total-cost) 2))
  )
  (:action schedule-s3
    :parameters ()
    :precondition (and (is-slot s3) (available kathryn s3) (available charlotte s3) (available lauren s3) (not (scheduled)) (within-cutoff s3))
    :effect (and (scheduled) (scheduled-at s3) (increase (total-cost) 3))
  )
  (:action schedule-s4
    :parameters ()
    :precondition (and (is-slot s4) (available kathryn s4) (available charlotte s4) (available lauren s4) (not (scheduled)) (within-cutoff s4))
    :effect (and (scheduled) (scheduled-at s4) (increase (total-cost) 4))
  )
  (:action schedule-s5
    :parameters ()
    :precondition (and (is-slot s5) (available kathryn s5) (available charlotte s5) (available lauren s5) (not (scheduled)) (within-cutoff s5))
    :effect (and (scheduled) (scheduled-at s5) (increase (total-cost) 5))
  )
  (:action schedule-s6
    :parameters ()
    :precondition (and (is-slot s6) (available kathryn s6) (available charlotte s6) (available lauren s6) (not (scheduled)) (within-cutoff s6))
    :effect (and (scheduled) (scheduled-at s6) (increase (total-cost) 6))
  )
  (:action schedule-s7
    :parameters ()
    :precondition (and (is-slot s7) (available kathryn s7) (available charlotte s7) (available lauren s7) (not (scheduled)) (within-cutoff s7))
    :effect (and (scheduled) (scheduled-at s7) (increase (total-cost) 7))
  )
  (:action schedule-s8
    :parameters ()
    :precondition (and (is-slot s8) (available kathryn s8) (available charlotte s8) (available lauren s8) (not (scheduled)) (within-cutoff s8))
    :effect (and (scheduled) (scheduled-at s8) (increase (total-cost) 8))
  )
  (:action schedule-s9
    :parameters ()
    :precondition (and (is-slot s9) (available kathryn s9) (available charlotte s9) (available lauren s9) (not (scheduled)) (within-cutoff s9))
    :effect (and (scheduled) (scheduled-at s9) (increase (total-cost) 9))
  )
  (:action schedule-s10
    :parameters ()
    :precondition (and (is-slot s10) (available kathryn s10) (available charlotte s10) (available lauren s10) (not (scheduled)) (within-cutoff s10))
    :effect (and (scheduled) (scheduled-at s10) (increase (total-cost) 10))
  )
  (:action schedule-s11
    :parameters ()
    :precondition (and (is-slot s11) (available kathryn s11) (available charlotte s11) (available lauren s11) (not (scheduled)) (within-cutoff s11))
    :effect (and (scheduled) (scheduled-at s11) (increase (total-cost) 11))
  )
  (:action schedule-s12
    :parameters ()
    :precondition (and (is-slot s12) (available kathryn s12) (available charlotte s12) (available lauren s12) (not (scheduled)) (within-cutoff s12))
    :effect (and (scheduled) (scheduled-at s12) (increase (total-cost) 12))
  )
  (:action schedule-s13
    :parameters ()
    :precondition (and (is-slot s13) (available kathryn s13) (available charlotte s13) (available lauren s13) (not (scheduled)) (within-cutoff s13))
    :effect (and (scheduled) (scheduled-at s13) (increase (total-cost) 13))
  )
  (:action schedule-s14
    :parameters ()
    :precondition (and (is-slot s14) (available kathryn s14) (available charlotte s14) (available lauren s14) (not (scheduled)) (within-cutoff s14))
    :effect (and (scheduled) (scheduled-at s14) (increase (total-cost) 14))
  )
  (:action schedule-s15
    :parameters ()
    :precondition (and (is-slot s15) (available kathryn s15) (available charlotte s15) (available lauren s15) (not (scheduled)) (within-cutoff s15))
    :effect (and (scheduled) (scheduled-at s15) (increase (total-cost) 15))
  )
)