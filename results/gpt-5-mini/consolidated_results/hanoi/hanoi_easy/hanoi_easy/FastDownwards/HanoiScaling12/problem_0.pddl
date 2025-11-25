(define (problem hanoi4-problem)
  (:domain hanoi4)

  ;; Objects: three pegs and four disks as specified
  (:objects
    A B C D - disk
    left middle right - peg
  )

  ;; Assumptions and modeling comments:
  ;; - We model stacks with direct-support predicates:
  ;;     (on-peg ?d ?p)    -> ?d is directly on peg ?p (i.e., the disk directly touching the peg)
  ;;     (on-disk ?d ?x)   -> ?d is directly on disk ?x
  ;;     (top ?d ?p)       -> ?d is the topmost disk on peg ?p
  ;;     (empty ?p)        -> peg contains no disks
  ;; - There is no global "stack list" object; the final goal enumerates the exact direct-support relations
  ;;   that produce the requested top-to-bottom ordering on the left peg.
  ;; - The domain provides separate action schemas for the four combinations of
  ;;   (moved-disk-on-peg|on-disk) x (destination-empty|onto-disk) so each action's effects can
  ;;   deterministically update top/empty/on-disk/on-peg predicates without conditional effects.
  ;; - We do not invent extra pegs/disks/resources. The middle peg is allowed as intermediate but
  ;;   the goal requires it to be empty at the end (hard constraint).
  ;; - All preferences described in natural language are encoded as hard constraints (e.g., middle empty).
  ;; - No bookkeeping shortcuts (tokens, counters, penalties) are used.

  (:init
    ;; typing facts (not required by planner but explicit)
    (disk A) (disk B) (disk C) (disk D)
    (peg left) (peg middle) (peg right)

    ;; Initial stacks as given: Right holds (top->bottom) A, B, C, D; left and middle empty.
    ;; Represented with direct relations: A on B, B on C, C on D, and D directly on the right peg.
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)

    ;; Top-of-peg facts
    (top A right)

    ;; Empty peg flags
    (empty left)
    (empty middle)
    ;; right is not empty initially (implicit by absence of (empty right))

    ;; Size relations: A < B < C < D (smaller facts used in preconditions)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  ;; Goal: left peg must hold the full stack top-to-bottom A,B,C,D and both middle and right must be empty.
  ;; We express the final left stack with direct-support relations producing that stack:
  ;;   top A on left, A on B, B on C, C on D, and D directly on the left peg.
  ;; We also require both middle and right to be empty (explicit hard constraints).
  (:goal (and
    ;; left stack structure
    (top A left)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)
    ;; enforce middle and right empty as required
    (empty middle)
    (empty right)
  ))
)