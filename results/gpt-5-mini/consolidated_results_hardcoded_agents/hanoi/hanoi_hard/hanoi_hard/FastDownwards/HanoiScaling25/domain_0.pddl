(define (domain tower-of-hanoi)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ;; relational state
    (on ?d ?x)                      ;; disk ?d is directly on entity ?x (disk or peg)
    (clear ?x)                      ;; nothing is directly on entity ?x (disk or peg)
    ;; authorization predicates (distinct agent roles)
    (authorized-empty ?d ?from ?to) ;; orchestrator authorized mover to move ?d from ?from to empty ?to
    (authorized-on ?d ?from ?to ?t) ;; orchestrator authorized mover to move ?d from ?from to be on top of disk ?t (which is on ?to)
    ;; static size relation (smaller ?a ?b) means ?a is strictly smaller than ?b
    (smaller ?a ?b)
  )

  ;; Orchestrator actions: must explicitly authorize a particular legal move before a mover can execute it.
  (:action orchestrator-authorize-empty
    :parameters (?d ?from ?to)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (not (authorized-empty ?d ?from ?to))
                  )
    :effect (and
              (authorized-empty ?d ?from ?to)
            )
  )

  (:action orchestrator-authorize-on
    :parameters (?d ?from ?to ?t)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (on ?t ?to)
                    (clear ?t)
                    (smaller ?d ?t)
                    (not (authorized-on ?d ?from ?to ?t))
                  )
    :effect (and
              (authorized-on ?d ?from ?to ?t)
            )
  )

  ;; Mover actions: must use an existing authorization and preserve disk-size ordering and clears.
  (:action mover-move-to-empty
    :parameters (?d ?from ?to)
    :precondition (and
                    (authorized-empty ?d ?from ?to)
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                  )
    :effect (and
              ;; move direct-support relation
              (not (on ?d ?from))
              (on ?d ?to)
              ;; update clears: destination no longer clear; former support becomes clear
              (not (clear ?to))
              (clear ?from)
              ;; consume the authorization
              (not (authorized-empty ?d ?from ?to))
            )
  )

  (:action mover-move-onto
    :parameters (?d ?from ?to ?t)
    :precondition (and
                    (authorized-on ?d ?from ?to ?t)
                    (on ?d ?from)
                    (clear ?d)
                    (on ?t ?to)
                    (clear ?t)
                    (smaller ?d ?t)
                  )
    :effect (and
              ;; move disk onto another disk ?t
              (not (on ?d ?from))
              (on ?d ?t)
              ;; destination top disk ?t no longer clear; former support becomes clear
              (not (clear ?t))
              (clear ?from)
              ;; consume the authorization
              (not (authorized-on ?d ?from ?to ?t))
            )
  )
)