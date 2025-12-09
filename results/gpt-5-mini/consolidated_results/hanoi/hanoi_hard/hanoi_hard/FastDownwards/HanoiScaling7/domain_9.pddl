(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  ;; disk and peg share a common supertype 'support' so a disk can be on either a disk or a peg
  (:types disk peg - support time)

  (:predicates
    ;; disk directly on a support (support = disk or peg)
    (on ?d - disk ?s - support)

    ;; nothing on top of a support (either a peg or a disk)
    (clear ?s - support)

    ;; size ordering: ?big is strictly larger than ?small
    (larger ?big - disk ?small - disk)

    ;; discrete time bookkeeping
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)           ; disk being moved must have nothing on top
      (clear ?to)          ; destination peg must have nothing on top (either empty or top)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the support we removed the disk from becomes clear on top
      (not (clear ?to))    ; destination peg no longer clear (now has ?d on top)
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Move a top disk onto an empty disk (requires size ordering)
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)           ; disk being moved must have nothing on top
      (clear ?to)          ; destination disk must have nothing on top
      (larger ?to ?d)      ; cannot place larger on smaller: destination must be larger
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the support we removed the disk from becomes clear on top
      (not (clear ?to))    ; destination disk no longer clear (now has ?d on top)
      (not (now ?t))
      (now ?t2)
    )
  )
)