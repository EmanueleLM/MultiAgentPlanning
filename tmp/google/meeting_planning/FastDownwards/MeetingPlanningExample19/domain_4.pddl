(define (domain combined-meet-scheduling-classical)
  (:requirements :strips :typing :action-costs :equality)
  (:types person location timepoint)

  (:predicates
    (at ?p - person ?l - location)
    (met ?a - person ?b - person)
    (curtime ?t - timepoint)
    (person-available-start ?p - person ?t - timepoint)
    (time-order ?t1 - timepoint ?t2 - timepoint)      ; t1 is before t2 (not necessarily immediate)
    (time-successor ?t1 - timepoint ?t2 - timepoint)  ; t2 is the immediate successor of t1
    (meeting-not-started ?a - person ?b - person)
    (meeting-stage1 ?a - person ?b - person ?t - timepoint)
    (meeting-stage2 ?a - person ?b - person ?t - timepoint)
    (meeting-completed ?a - person ?b - person)
  )

  ;; Travel actions for visitor: two fixed costs depending on direction
  (:action travel-visitor-ggp-to-ph
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (at visitor golden-gate-park)
      (curtime ?from)
      (time-order ?from ?to)
    )
    :effect (and
      (not (at visitor golden-gate-park))
      (at visitor pacific-heights)
      (not (curtime ?from))
      (curtime ?to)
    )
    :cost 16
  )

  (:action travel-visitor-ph-to-ggp
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (at visitor pacific-heights)
      (curtime ?from)
      (time-order ?from ?to)
    )
    :effect (and
      (not (at visitor pacific-heights))
      (at visitor golden-gate-park)
      (not (curtime ?from))
      (curtime ?to)
    )
    :cost 15
  )

  ;; Travel actions for john (allow both directions, same costs)
  (:action travel-john-ggp-to-ph
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (at john golden-gate-park)
      (curtime ?from)
      (time-order ?from ?to)
    )
    :effect (and
      (not (at john golden-gate-park))
      (at john pacific-heights)
      (not (curtime ?from))
      (curtime ?to)
    )
    :cost 16
  )

  (:action travel-john-ph-to-ggp
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and
      (at john pacific-heights)
      (curtime ?from)
      (time-order ?from ?to)
    )
    :effect (and
      (not (at john pacific-heights))
      (at john golden-gate-park)
      (not (curtime ?from))
      (curtime ?to)
    )
    :cost 15
  )

  ;; Advance time to immediate successor without moving agents (zero cost)
  (:action advance-time
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (curtime ?from) (time-successor ?from ?to))
    :effect (and (not (curtime ?from)) (curtime ?to))
    :cost 0
  )

  ;; Meeting sequence: requires both at Pacific Heights and John's availability at each timepoint.
  ;; Stage 1: start meeting at time t
  (:action meeting-start
    :parameters (?a - person ?b - person ?t - timepoint)
    :precondition (and
      (at ?a pacific-heights)
      (at ?b pacific-heights)
      (curtime ?t)
      (person-available-start ?b ?t)
      (meeting-not-started ?a ?b)
    )
    :effect (and
      (not (meeting-not-started ?a ?b))
      (meeting-stage1 ?a ?b ?t)
    )
    :cost 0
  )

  ;; Stage 1 -> Stage 2: continue to immediate successor timepoint
  (:action meeting-continue-to-2
    :parameters (?a - person ?b - person ?t1 - timepoint ?t2 - timepoint)
    :precondition (and
      (meeting-stage1 ?a ?b ?t1)
      (time-successor ?t1 ?t2)
      (curtime ?t2)
      (person-available-start ?b ?t2)
      (at ?a pacific-heights)
      (at ?b pacific-heights)
    )
    :effect (and
      (not (meeting-stage1 ?a ?b ?t1))
      (meeting-stage2 ?a ?b ?t2)
    )
    :cost 0
  )

  ;; Stage 2 -> Stage 3 (completion): immediate successor again; set met and meeting-completed
  (:action meeting-complete
    :parameters (?a - person ?b - person ?t2 - timepoint ?t3 - timepoint)
    :precondition (and
      (meeting-stage2 ?a ?b ?t2)
      (time-successor ?t2 ?t3)
      (curtime ?t3)
      (person-available-start ?b ?t3)
      (at ?a pacific-heights)
      (at ?b pacific-heights)
    )
    :effect (and
      (not (meeting-stage2 ?a ?b ?t2))
      (met ?a ?b)
      (meeting-completed ?a ?b)
    )
    :cost 0
  )
)