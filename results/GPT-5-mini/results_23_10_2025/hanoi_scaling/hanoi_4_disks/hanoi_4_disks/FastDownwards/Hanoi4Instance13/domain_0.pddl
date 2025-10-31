(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; location predicates: a disk may be directly on a peg or on another disk
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?b - disk)

    ;; clear indicators for top-of-place
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; strict size ordering (static)
    (smaller ?s - disk ?b - disk)

    ;; which peg ultimately supports a disk (used to decide which agent may move it)
    (support ?d - disk ?p - peg)

    ;; agent controls which peg
    (controls ?ag - agent ?p - peg)
  )

  ;; Move a disk that is directly on a peg to an empty peg (agent must control the source peg)
  (:action move-from-peg-to-peg-by-agent
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?sp - peg)
    :precondition (and
      (controls ?ag ?sp)
      (support ?d ?sp)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (support ?d ?sp))
      (support ?d ?to)
    )
  )

  ;; Move a disk that is directly on a disk to an empty peg (agent controls the supporting peg)
  (:action move-from-disk-to-peg-by-agent
    :parameters (?ag - agent ?d - disk ?fromdisk - disk ?to - peg ?sp - peg)
    :precondition (and
      (controls ?ag ?sp)
      (support ?d ?sp)
      (on-disk ?d ?fromdisk)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?fromdisk)
      (not (support ?d ?sp))
      (support ?d ?to)
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (agent controls the source peg).
  ;; Requires that the moving disk is smaller than the destination disk.
  (:action move-from-peg-to-disk-by-agent
    :parameters (?ag - agent ?d - disk ?from - peg ?t - disk ?sp - peg ?tsp - peg)
    :precondition (and
      (controls ?ag ?sp)
      (support ?d ?sp)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (support ?t ?tsp)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)
      (not (clear-disk ?t))
      (clear-peg ?from)
      (not (support ?d ?sp))
      (support ?d ?tsp)
    )
  )

  ;; Move a disk that is directly on another disk onto a different disk (agent controls the source peg).
  ;; Requires that the moving disk is smaller than the destination disk.
  (:action move-from-disk-to-disk-by-agent
    :parameters (?ag - agent ?d - disk ?fromdisk - disk ?t - disk ?sp - peg ?tsp - peg)
    :precondition (and
      (controls ?ag ?sp)
      (support ?d ?sp)
      (on-disk ?d ?fromdisk)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (support ?t ?tsp)
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-disk ?d ?t)
      (not (clear-disk ?t))
      (clear-disk ?fromdisk)
      (not (support ?d ?sp))
      (support ?d ?tsp)
    )
  )
)