(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; structural relations
    (on-disk ?d - disk ?below - disk)    ; ?d is directly on top of disk ?below
    (on-peg  ?d - disk ?p - peg)         ; ?d is directly on peg ?p (i.e. is the bottom-most on that peg)
    (at      ?d - disk ?p - peg)         ; disk ?d belongs to peg ?p (its current peg)
    (clear   ?d - disk)                  ; nothing on top of disk ?d
    (empty   ?p - peg)                   ; peg ?p has no disks
    (smaller ?d1 - disk ?d2 - disk)      ; ?d1 is strictly smaller than ?d2
  )

  ;; Move a disk that is directly on a (source) peg to an empty destination peg
  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      ;; relocate disk ?d to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (at ?d ?from))
      (at ?d ?to)

      ;; update peg occupancy flags
      (not (empty ?to))
      (empty ?from)

      ;; top disk remains clear
      (clear ?d)
    )
  )

  ;; Move a disk that is directly on another disk (on-disk ?d ?below) to an empty destination peg
  (:action move-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (at ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; remove relation to below and place on destination peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (at ?d ?from))
      (at ?d ?to)

      ;; now the below disk has nothing on it
      (clear ?below)

      ;; destination peg becomes non-empty
      (not (empty ?to))

      ;; ?d remains clear (top)
      (clear ?d)
    )
  )

  ;; Move a disk that is directly on a (source) peg onto another disk (destination top disk exists)
  (:action move-onpeg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?top)
      (at ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      ;; remove disk ?d from source peg and put it on top of ?top
      (not (on-peg ?d ?from))
      (not (at ?d ?from))
      (on-disk ?d ?top)
      (at ?d ?to)

      ;; top disk is no longer clear; ?d becomes the new clear disk
      (not (clear ?top))
      (clear ?d)

      ;; peg occupancy updates
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a disk that is on another disk onto another disk
  (:action move-ondisk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?top)
      (at ?d ?from)
      (at ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      ;; detach from old below and attach on top of new top
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d ?from))
      (at ?d ?to)

      ;; ?d remains clear (top)
      (clear ?d)
    )
  )
)