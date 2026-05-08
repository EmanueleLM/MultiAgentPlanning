(define (problem hanoi-7-right-to-middle)
  (:domain hanoi-seven)

  ; Objects
  ; disks: a (smallest) ... g (largest)
  ; pegs: left, middle, right
  (:objects
    a b c d e f g - disk
    left middle right - peg
    ;; Note: predicates expect places as generic objects; pegs and disks are declared above.
  )

  ;-------------------------------------------------------------------------
  ; Mapping from the validated move sequence to this PDDL problem:
  ; - The provided mover plan is the canonical optimal 127-move solution for 7 disks,
  ;   transferring the stack from peg "right" to peg "middle" using "left" as auxiliary.
  ; - This PDDL problem encodes the same instance:
  ;     * Initial state: all disks a..g stacked on right, with a on top and g on bottom.
  ;     * Goal state: all disks stacked on middle in the same order (a top ... g bottom).
  ; - Each move in the validated sequence corresponds to one application of either
  ;   move-to-peg or move-to-disk in the domain above. The domain enforces legality:
  ;   only top disks may be moved, and a disk may only be placed on an empty peg or on a
  ;   strictly larger disk (via the smaller relation).
  ; - The left peg may be used as intermediate but the goal enforces it is empty (clear).
  ;-------------------------------------------------------------------------

  (:init
    ;; Initial stack on right: a on b, b on c, ..., f on g, g on right (a is top)
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g right)

    ;; Clear facts: only topmost disk a is clear; empty pegs left and middle are clear;
    ;; right is not clear because it has the stack.
    (clear a)
    (clear left)
    (clear middle)
    ;; Other disks not clear implicitly (they are supporting other disks). We only need to state positive facts.

    ;; Size ordering (strict): smaller x y if x is smaller than y.
    ;; Enumerate all ordered pairs where the first is smaller than the second.
    ;; a is smallest, g is largest.
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g)
    (smaller d e) (smaller d f) (smaller d g)
    (smaller e f) (smaller e g)
    (smaller f g)
  )

  ; Goal: full stack a..g on middle (a on b, b on c, ..., f on g, g on middle),
  ; and both left and right pegs must be empty (clear).
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g middle)

    (clear left)   ; left peg must be empty in final state (explicit hard constraint)
    (clear right)  ; right peg must be empty in final state
  ))
)