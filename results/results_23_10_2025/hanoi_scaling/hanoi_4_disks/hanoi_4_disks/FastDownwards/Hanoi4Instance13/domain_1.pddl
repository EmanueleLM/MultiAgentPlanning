(define (domain hanoi4instance13)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; disk is directly on a peg (i.e., the disk is the bottom of a local stack)
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on another disk
    (on-disk ?d - disk ?b - disk)

    ;; indicators that a peg is empty (no disk directly on it)
    (clear-peg ?p - peg)
    ;; indicator that a disk has nothing on top of it (is top)
    (clear-disk ?d - disk)

    ;; static size ordering: smaller ?s ?b means s is strictly smaller than b
    (smaller ?s - disk ?b - disk)

    ;; which peg ultimately supports a disk (the peg under the entire stack containing the disk)
    (support ?d - disk ?p - peg)

    ;; agent controls a peg (only the agent that controls the source peg may move a top disk from that peg)
    (controls ?ag - agent ?p - peg)
  )

  ;; Move a top disk that is directly on a peg to another empty peg.
  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?sp - peg)
    :precondition (and
      (controls ?ag ?sp)        ;; agent controls source peg
      (support ?d ?sp)         ;; this disk is supported by the source peg
      (on-peg ?d ?from)        ;; disk is directly on the source peg
      (clear-disk ?d)          ;; disk is top (nothing on it)
      (clear-peg ?to)          ;; destination peg is empty
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; update support: now the disk is supported by destination peg
      (not (support ?d ?sp))
      (support ?d ?to)
    )
  )

  ;; Move a top disk that is directly on a disk to an empty peg.
  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?fromdisk - disk ?to - peg ?sp - peg)
    :precondition (and
      (controls ?ag ?sp)         ;; agent controls the peg that ultimately supports the moving disk
      (support ?d ?sp)          ;; moving disk is supported by that peg
      (on-disk ?d ?fromdisk)    ;; disk is directly on another disk
      (clear-disk ?d)           ;; moving disk is top
      (clear-peg ?to)           ;; destination peg is empty
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-peg ?d ?to)

      ;; the disk that lost the top disk becomes clear
      (clear-disk ?fromdisk)

      ;; peg occupancy updates
      (not (clear-peg ?to))

      ;; update support: moving disk now supported by destination peg
      (not (support ?d ?sp))
      (support ?d ?to)
    )
  )

  ;; Move a top disk that is directly on a peg onto another disk (must be smaller than the destination disk).
  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?t - disk ?sp - peg ?tsp - peg)
    :precondition (and
      (controls ?ag ?sp)          ;; agent controls the peg that supports the moving disk
      (support ?d ?sp)           ;; moving disk currently supported by that peg
      (on-peg ?d ?from)          ;; moving disk directly on a peg
      (clear-disk ?d)            ;; moving disk is top
      (clear-disk ?t)            ;; target disk is top (so we place on it)
      (smaller ?d ?t)            ;; size constraint: moving disk smaller than target disk
      (support ?t ?tsp)          ;; target disk is supported by some peg (we need its peg to set new support)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      ;; target disk is no longer clear (now has a disk on top)
      (not (clear-disk ?t))

      ;; source peg becomes clear
      (clear-peg ?from)

      ;; update support of moving disk to the peg that supports the target disk
      (not (support ?d ?sp))
      (support ?d ?tsp)
    )
  )

  ;; Move a top disk that is directly on another disk onto a different disk (must be smaller).
  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?fromdisk - disk ?t - disk ?sp - peg ?tsp - peg)
    :precondition (and
      (controls ?ag ?sp)          ;; agent controls the peg supporting the moving disk
      (support ?d ?sp)           ;; moving disk is supported by that peg
      (on-disk ?d ?fromdisk)     ;; moving disk directly on another disk
      (clear-disk ?d)            ;; moving disk is top
      (clear-disk ?t)            ;; destination disk is top
      (smaller ?d ?t)            ;; size constraint
      (support ?t ?tsp)          ;; target disk's supporting peg (to set support for moving disk)
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-disk ?d ?t)

      ;; the disk that lost its top becomes clear
      (clear-disk ?fromdisk)

      ;; target disk is no longer clear
      (not (clear-disk ?t))

      ;; update support of moving disk to the peg that supports the target disk
      (not (support ?d ?sp))
      (support ?d ?tsp)
    )
  )
)