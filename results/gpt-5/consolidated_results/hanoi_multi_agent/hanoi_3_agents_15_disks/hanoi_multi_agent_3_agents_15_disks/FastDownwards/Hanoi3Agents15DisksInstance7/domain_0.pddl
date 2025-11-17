(define (domain hanoi-3peg-15disk-ordered)
  (:requirements :strips :typing)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (may-move ?a - agent ?d - disk)
    (phase1)
    (phase2)
    (phase3)
    (want-step1-to-peg ?d - disk ?p - peg)
    (want-step2-to-peg ?d - disk ?p - peg)
    (want-step3-to-disk ?d - disk ?below - disk)
    (finished)
  )

  ; Step 1: move designated disk to a designated peg
  (:action do-step1-move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (phase1)
      (want-step1-to-peg ?d ?p)
      (may-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (phase1))
      (phase2)
    )
  )

  ; Step 2: move designated disk to a designated peg
  (:action do-step2-move-to-peg
    :parameters (?a - agent ?d - disk ?from - support ?p - peg)
    :precondition (and
      (phase2)
      (want-step2-to-peg ?d ?p)
      (may-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (phase2))
      (phase3)
    )
  )

  ; Step 3: move designated disk onto a designated disk (enforcing size legality)
  (:action do-step3-move-to-disk
    :parameters (?a - agent ?d - disk ?from - support ?below - disk)
    :precondition (and
      (phase3)
      (want-step3-to-disk ?d ?below)
      (may-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?below)
      (smaller ?d ?below)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?below)
      (clear ?from)
      (not (clear ?below))
      (finished)
    )
  )
)