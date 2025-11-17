(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    ;; ownership predicates (which agent may move the disk)
    (a-disk ?d - object)
    (b-disk ?d - object)
    (c-disk ?d - object)

    ;; on relations per agent: disk is on a support (another disk or a peg)
    (a-on ?d - object ?s - object)
    (b-on ?d - object ?s - object)
    (c-on ?d - object ?s - object)

    ;; clear indicates that a support (disk or peg) has no disk on top for that agent
    (a-clear ?s - object)
    (b-clear ?s - object)
    (c-clear ?s - object)

    ;; size ordering per agent: smaller -> bigger
    (a-smaller ?small - object ?big - object)
    (b-smaller ?small - object ?big - object)
    (c-smaller ?small - object ?big - object)
  )

  ;; Agent 1 actions (prefix a-)
  (:action a-move-to-peg
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (a-disk ?d)
      (a-on ?d ?from)
      (a-clear ?d)
      (a-clear ?to)
    )
    :effect (and
      (not (a-on ?d ?from))
      (a-on ?d ?to)
      (not (a-clear ?d))
      (a-clear ?from)
      (not (a-clear ?to))
    )
  )

  (:action a-move-to-disk
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (a-disk ?d)
      (a-on ?d ?from)
      (a-clear ?d)
      (a-clear ?to)
      (a-smaller ?d ?to)
    )
    :effect (and
      (not (a-on ?d ?from))
      (a-on ?d ?to)
      (not (a-clear ?d))
      (a-clear ?from)
      (not (a-clear ?to))
    )
  )

  ;; Agent 2 actions (prefix b-)
  (:action b-move-to-peg
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (b-disk ?d)
      (b-on ?d ?from)
      (b-clear ?d)
      (b-clear ?to)
    )
    :effect (and
      (not (b-on ?d ?from))
      (b-on ?d ?to)
      (not (b-clear ?d))
      (b-clear ?from)
      (not (b-clear ?to))
    )
  )

  (:action b-move-to-disk
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (b-disk ?d)
      (b-on ?d ?from)
      (b-clear ?d)
      (b-clear ?to)
      (b-smaller ?d ?to)
    )
    :effect (and
      (not (b-on ?d ?from))
      (b-on ?d ?to)
      (not (b-clear ?d))
      (b-clear ?from)
      (not (b-clear ?to))
    )
  )

  ;; Agent 3 actions (prefix c-)
  (:action c-move-to-peg
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (c-disk ?d)
      (c-on ?d ?from)
      (c-clear ?d)
      (c-clear ?to)
    )
    :effect (and
      (not (c-on ?d ?from))
      (c-on ?d ?to)
      (not (c-clear ?d))
      (c-clear ?from)
      (not (c-clear ?to))
    )
  )

  (:action c-move-to-disk
    :parameters (?d - object ?from - object ?to - object)
    :precondition (and
      (c-disk ?d)
      (c-on ?d ?from)
      (c-clear ?d)
      (c-clear ?to)
      (c-smaller ?d ?to)
    )
    :effect (and
      (not (c-on ?d ?from))
      (c-on ?d ?to)
      (not (c-clear ?d))
      (c-clear ?from)
      (not (c-clear ?to))
    )
  )
)