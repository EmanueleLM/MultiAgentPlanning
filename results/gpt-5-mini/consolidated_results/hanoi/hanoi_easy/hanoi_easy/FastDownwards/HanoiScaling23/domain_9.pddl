(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent stage)

  (:predicates
    (is-agent ?a - agent)
    (on-peg ?d - disk ?p - peg)        ; ?d is directly on peg ?p
    (on-disk ?d - disk ?under - disk) ; ?d is directly on top of ?under
    (clear ?d - disk)                 ; no disk on top of ?d
    (empty ?p - peg)                  ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
    (at-stage ?s - stage)             ; current stage/time is ?s
    (next ?s - stage ?s2 - stage)     ; successor relation between stages
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg onto another top disk
  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear ?to))
      (empty ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg
  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (clear ?below)
      (not (empty ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk
  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?below - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (is-agent ?ag)
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)
      (clear ?below)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)