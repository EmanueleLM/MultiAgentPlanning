(define (domain hanoi-orchestrator)
  (:requirements :strips :typing :negative-preconditions)

  ;; Types:
  ;; - place: abstract supertype for peg or disk (places that can support a disk)
  ;; - peg and disk are subtypes of place
  ;; - stage: ordered discrete time markers
  (:types place - object
          peg disk - place
          stage - object)

  (:predicates
    ;; disk ?d is directly on place ?p (place = peg or disk)
    (on ?d - disk ?p - place)

    ;; place (peg or disk) currently has nothing directly on top
    (clear ?p - place)

    ;; static size ordering: ?x is strictly smaller than ?y
    (smaller ?x - disk ?y - disk)

    ;; current active stage/time marker (exactly one current stage is true in initial state,
    ;; actions advance it discretely via next relation)
    (current ?t - stage)

    ;; successor relation between stages (ordered discrete time steps)
    (next ?t1 - stage ?t2 - stage)
  )

  ;; Move the top disk from its current support (?below) onto an empty peg (?to).
  ;; Preconditions enforce: disk is top of its support, destination peg is empty,
  ;; and stage advancement is respected (discrete progression).
  (:action move-to-peg
    :parameters (?d - disk ?below - place ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; disk ?d must be directly on ?below and be the top disk there
      (on ?d ?below)
      (clear ?d)

      ;; destination peg must be empty (no disk directly on it)
      (clear ?to)

      ;; prevent no-op/self moves or ill-formed supports
      (not (= ?below ?to))
      (not (= ?d ?below))
      (not (= ?d ?to))
    )
    :effect (and
      ;; disk is relocated from its former support to the target peg
      (not (on ?d ?below))
      (on ?d ?to)

      ;; former support becomes clear (its top element was removed)
      (clear ?below)

      ;; destination peg is no longer clear (now has ?d on top)
      (not (clear ?to))

      ;; moved disk remains clear (nothing on top of it immediately after move)
      (clear ?d)

      ;; advance the global stage marker (discrete time progression)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move the top disk from its current support (?below) onto another top disk (?top).
  ;; Enforces size ordering: only a smaller disk may be placed on a larger one,
  ;; and forbids moving a disk onto itself or onto its own support.
  (:action move-onto-disk
    :parameters (?d - disk ?below - place ?top - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)

      ;; source/top conditions
      (on ?d ?below)
      (clear ?d)

      ;; destination top disk must be the top element at its place
      (clear ?top)

      ;; size constraint: moving disk must be strictly smaller than destination top
      (smaller ?d ?top)

      ;; prevent moving onto itself or onto its own support
      (not (= ?d ?top))
      (not (= ?below ?top))
      (not (= ?d ?below))
    )
    :effect (and
      ;; relocate disk to be directly on the destination disk ?top
      (not (on ?d ?below))
      (on ?d ?top)

      ;; former support becomes clear (its top element was removed)
      (clear ?below)

      ;; the former top ?top is no longer clear (it now has ?d on top)
      (not (clear ?top))

      ;; moved disk is top at its destination
      (clear ?d)

      ;; advance the global stage marker
      (not (current ?t))
      (current ?t2)
    )
  )
)