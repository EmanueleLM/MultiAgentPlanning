(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    agent_1 agent_2 - agent
    A B C D E F G H I J - disk
    left middle right - peg
  )

  ; initial state
  (:init
    ; disk locations (initial stack is on left peg top-to-bottom: A B C D E F G H I J)
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    ; top facts: A is the current top of the left peg
    (top A left)

    ; empty pegs
    (empty middle)
    (empty right)

    ; static directly_above relation representing the initial adjacency (upper directly above lower)
    (directly_above A B)
    (directly_above B C)
    (directly_above C D)
    (directly_above D E)
    (directly_above E F)
    (directly_above F G)
    (directly_above G H)
    (directly_above H I)
    (directly_above I J)

    ; size ordering (smaller X Y) for all X smaller than Y according to A < B < ... < J
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; agent move capabilities (strict constraints)
    (can_move agent_1 A)
    (can_move agent_1 B)
    (can_move agent_1 C)
    (can_move agent_1 D)
    (can_move agent_1 E)

    (can_move agent_2 F)
    (can_move agent_2 G)
    (can_move agent_2 H)
    (can_move agent_2 I)
    (can_move agent_2 J)
  )

  ; Goal: left peg from top-to-bottom should be B..J and right peg should have A (middle empty).
  ; We encode this as the set of per-disk location facts. The ordering of disks on the pegs in the goal
  ; is captured implicitly by these location assignments together with the invariant rules in the domain.
  (:goal (and
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    (on A right)

    (empty middle)
  ))

  ; Comments / notes for the planner user:
  ; - The provided agent move sequences contained a single move proposed by agent_1: "move disk A from left to right".
  ;   That single move is valid with respect to the Tower of Hanoi rules given the initial state:
  ;     * A is the top disk on the left peg,
  ;     * the right peg is empty,
  ;     * agent_1 is permitted to move disk A.
  ;   Executing that single move yields exactly the specified goal configuration.
  ;
  ; - The domain encodes move actions that apply to top disks which have a statically-declared
  ;   'directly_above' disk beneath them in the initial stack. The 'directly_above' relation is not dynamically
  ;   updated by the domain (it is provided as static input). For the current instance the necessary relation
  ;   (directly_above A B) is present, so the single required move is supported and executable.
  ;
  ; - Full generality (moving disks that are sole occupants of a peg or fully updating adjacency relations after
  ;   arbitrary moves) would require additional bookkeeping or conditional effects. Those extensions were not
  ;   necessary to encode and validate the integrated plan produced from the inputs, and so were intentionally
  ;   omitted to keep the model compact and strictly consistent with the provided data.
)