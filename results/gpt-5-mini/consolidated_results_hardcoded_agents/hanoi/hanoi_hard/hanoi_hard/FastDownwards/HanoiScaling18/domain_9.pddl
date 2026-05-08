(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    disk peg - place
    stage - object
  )

  (:predicates
    ;; disk ?d is directly on place ?p (a disk or a peg)
    (on ?d - disk ?p - place)

    ;; nothing on top of this place (disk or peg) — true iff topmost
    (clear ?p - place)

    ;; strict size ordering: ?big is larger than ?small
    (larger ?big - disk ?small - disk)

    ;; discrete stage control: which stage is current and immediate successor relation
    (stage-current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from its direct support ?from onto an empty peg ?to.
  ;; Enforces: disk is on ?from, disk is top (clear), target peg empty (clear),
  ;; and stage advances from ?s to its successor ?s2.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target now has something on top
      (not (clear ?to))

      ;; the former support becomes top (clear)
      (clear ?from)

      ;; moved disk is top on its new support
      (clear ?d)

      ;; advance discrete stage
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )

  ;; Move a top disk from its direct support ?from onto another disk ?to that is strictly larger and currently clear.
  ;; Enforces: disk is on ?from and clear, target disk clear and larger, stage advances.
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (stage-current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      ;; target disk now has something on top
      (not (clear ?to))

      ;; the former support becomes top (clear)
      (clear ?from)

      ;; moved disk is top on its new support
      (clear ?d)

      ;; advance discrete stage
      (not (stage-current ?s))
      (stage-current ?s2)
    )
  )
)