(define (domain hanoi-7)
  (:requirements :strips :typing)
  (:types disk peg - object)
  (:predicates
    (peg ?p - peg)
    (disk ?d - disk)
    ;; support is represented by either a disk or a peg; on_direct links a disk to its immediate support
    (on_direct ?d - disk ?s - object)        ; ?s is either a disk or a peg (treated uniformly as object)
    (on_stack ?d - disk ?p - peg)            ; transitive membership of disk on a peg
    (top_of_peg ?d - disk ?p - peg)          ; disk is topmost on peg
    (clear ?x - object)                      ; nothing directly on this disk or peg
    (smaller ?d1 - disk ?d2 - disk)          ; size ordering: ?d1 is smaller than ?d2
    (empty ?p - peg)                         ; peg has no disks (convenience predicate)
    (above ?d1 - disk ?d2 - disk)            ; transitive "above" relation (not actively maintained by actions)
  )

  ;; ACTIONS
  ;; 1) Move where the disk's immediate support is another disk, and destination peg is empty
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - disk)
    :precondition (and
       (disk ?d) (peg ?from) (peg ?to)
       (on_direct ?d ?s)                  ; support is a disk
       (on_stack ?s ?from)                ; support is on the source peg
       (top_of_peg ?d ?from)              ; ?d is top of source peg
       (empty ?to)                        ; destination peg is empty
    )
    :effect (and
       (not (on_direct ?d ?s))
       (on_direct ?d ?to)

       (not (top_of_peg ?d ?from))
       (top_of_peg ?d ?to)

       ;; previous support ?s (a disk) becomes clear and becomes new top on source peg
       (clear ?s)
       (top_of_peg ?s ?from)

       ;; destination peg was empty -> no longer empty and not clear as it now holds ?d directly
       (not (empty ?to))
       (not (clear ?to))

       ;; update on_stack membership of moved disk
       (not (on_stack ?d ?from))
       (on_stack ?d ?to)
    )
  )

  ;; 2) Move where the disk's immediate support is another disk, and destination peg has a top disk ?d2
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?s - disk ?d2 - disk)
    :precondition (and
       (disk ?d) (peg ?from) (peg ?to)
       (on_direct ?d ?s)                  ; support is a disk
       (on_stack ?s ?from)
       (top_of_peg ?d ?from)
       (top_of_peg ?d2 ?to)
       (smaller ?d ?d2)                   ; size constraint: moving disk must be smaller than destination top
    )
    :effect (and
       (not (on_direct ?d ?s))
       (on_direct ?d ?d2)

       (not (top_of_peg ?d ?from))
       (top_of_peg ?d ?to)

       ;; previous support ?s becomes clear and becomes top on source peg
       (clear ?s)
       (top_of_peg ?s ?from)

       ;; destination top disk ceases to be clear (it now has ?d on it)
       (not (clear ?d2))

       ;; update on_stack membership of moved disk
       (not (on_stack ?d ?from))
       (on_stack ?d ?to)
    )
  )

  ;; 3) Move where the disk's immediate support is a peg, and destination peg is empty
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
       (disk ?d) (peg ?from) (peg ?to)
       (on_direct ?d ?from)               ; ?d is directly on the source peg (hence was the only disk on that peg)
       (top_of_peg ?d ?from)
       (empty ?to)
    )
    :effect (and
       (not (on_direct ?d ?from))
       (on_direct ?d ?to)

       (not (top_of_peg ?d ?from))
       (top_of_peg ?d ?to)

       ;; source peg becomes empty and clear
       (empty ?from)
       (clear ?from)

       ;; destination peg ceases to be empty/clear
       (not (empty ?to))
       (not (clear ?to))

       ;; update on_stack membership of moved disk
       (not (on_stack ?d ?from))
       (on_stack ?d ?to)
    )
  )

  ;; 4) Move where the disk's immediate support is a peg, and destination peg has a top disk ?d2
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
       (disk ?d) (peg ?from) (peg ?to)
       (on_direct ?d ?from)               ; ?d directly on source peg
       (top_of_peg ?d ?from)
       (top_of_peg ?d2 ?to)
       (smaller ?d ?d2)
    )
    :effect (and
       (not (on_direct ?d ?from))
       (on_direct ?d ?d2)

       (not (top_of_peg ?d ?from))
       (top_of_peg ?d ?to)

       ;; source peg becomes empty and clear
       (empty ?from)
       (clear ?from)

       ;; destination top disk ceases to be clear
       (not (clear ?d2))

       ;; update on_stack membership of moved disk
       (not (on_stack ?d ?from))
       (on_stack ?d ?to)
    )
  )
)