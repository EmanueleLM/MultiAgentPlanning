(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage - object)

  (:predicates
    ;; typing predicates (optional but explicit)
    (disk ?d - disk)
    (peg ?p - peg)
    (stage ?s - stage)

    ;; static: size ordering (smaller ?x ?y) true iff x is strictly smaller than y
    (smaller ?d1 - disk ?d2 - disk)

    ;; stacking relations:
    ;; (on ?d ?s) means disk ?d is immediately above/support ?s (?s is either a peg or a disk)
    (on ?d - disk ?s - object)

    ;; (top ?d ?p) means disk ?d is currently the top disk on peg ?p
    (top ?d - disk ?p - peg)

    ;; (empty ?p) means peg ?p currently has no disks
    (empty ?p - peg)

    ;; explicit stage progression:
    ;; (succ ?s ?s2) defines the next stage after ?s
    (succ ?s - stage ?s2 - stage)
    ;; (active ?s) marks the currently active stage; exactly one stage is active in any reachable state
    (active ?s - stage)
  )

  ;; Move a top disk that is immediately supported by a peg (i.e., its support is the peg itself)
  ;; to an empty peg. This consumes one stage unit (advances active stage).
  (:action move-top-from-peg-to-empty-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)         ; support is the peg ?from (no disk directly under ?d)
      (empty ?to)
    )
    :effect (and
      ;; stack update
      (not (on ?d ?from))
      (on ?d ?to)
      ;; top updates
      (not (top ?d ?from))
      (top ?d ?to)
      ;; peg occupancy updates
      (not (empty ?to))
      (empty ?from)
      ;; stage advancement (only one active stage at a time)
      (not (active ?s))
      (active ?s2)
    )
  )

  ;; Move a top disk that is immediately supported by a peg (?from)
  ;; onto another peg ?to whose top disk is ?t (must respect size ordering).
  (:action move-top-from-peg-onto-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?from)         ; support is peg ?from
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stack update: d now on top disk t
      (not (on ?d ?from))
      (on ?d ?t)
      ;; top updates for target
      (not (top ?t ?to))
      (top ?d ?to)
      ;; source peg becomes empty (since d had peg as support)
      (not (top ?d ?from))
      (empty ?from)
      ;; stage advancement
      (not (active ?s))
      (active ?s2)
    )
  )

  ;; Move a top disk that is immediately supported by another disk (?b)
  ;; to an empty peg. After moving, the disk ?b becomes the new top of the source peg.
  (:action move-top-from-disk-to-empty-peg
    :parameters (?d - disk ?b - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?b)            ; ?d's immediate support is disk ?b
      (empty ?to)
    )
    :effect (and
      ;; stack update
      (not (on ?d ?b))
      (on ?d ?to)
      ;; top updates
      (not (top ?d ?from))
      (top ?d ?to)
      (top ?b ?from)        ; the disk that was under becomes the new top on ?from
      ;; target peg becomes non-empty
      (not (empty ?to))
      ;; stage advancement
      (not (active ?s))
      (active ?s2)
    )
  )

  ;; Move a top disk that is immediately supported by another disk (?b)
  ;; onto another peg ?to whose top disk is ?t (respecting size order).
  ;; After moving, ?b becomes the new top on the source peg.
  (:action move-top-from-disk-onto-disk
    :parameters (?d - disk ?b - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (active ?s)
      (succ ?s ?s2)
      (top ?d ?from)
      (on ?d ?b)            ; ?d supported by disk ?b
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; stack update
      (not (on ?d ?b))
      (on ?d ?t)
      ;; top updates
      (not (top ?t ?to))
      (top ?d ?to)
      (not (top ?d ?from))
      (top ?b ?from)
      ;; stage advancement
      (not (active ?s))
      (active ?s2)
    )
  )
)