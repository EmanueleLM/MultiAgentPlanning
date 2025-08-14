(define (problem blockworld-setup)
  (:domain blockworld)

  (:objects
     A B C D E  - block
     table      - table
  )

  (:init
     ;; Initial configuration – every block is on the table and clear
     (on A table)  (clear A)
     (on B table)  (clear B)
     (on C table)  (clear C)
     (on D table)  (clear D)
     (on E table)  (clear E)

     ;; The table is always clear – we need it as a precondition target
     (clear table)
  )

  (:goal (and
            (on E table)
            (on D E)
            (on B D)
            (on C B)
            (clear C)
            (on A table)
            (clear A)
          ))
)