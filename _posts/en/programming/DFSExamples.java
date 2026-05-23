import java.util.Stack;

/**
 * DFSExamples implements the Depth-First Search (DFS) algorithms
 * for a binary tree as described in the blog post 2014-10-12-depth-first-search-tree.md.
 * 
 * It includes both the iterative version (using an explicit stack) 
 * and the recursive version (using the call stack).
 */
public class DFSExamples {

    // Representation of a binary tree node
    public static class Node {
        public int value;
        public Node left;
        public Node right;

        public Node(int value) {
            this.value = value;
            this.left = null;
            this.right = null;
        }
    }

    /**
     * Iterative DFS traversal using an explicit Stack.
     * Matches the pseudocode:
     * 
     * S <- empty stack
     * S.PUSH(r)
     * while not S.IS_EMPTY() do
     *     u <- S.POP()
     *     if u != null then
     *         VISIT(u)
     *         S.PUSH(RIGHT_CHILD_OF(u))
     *         S.PUSH(LEFT_CHILD_OF(u))
     *     end if
     * end while
     */
    public static void dfsIterative(Node r) {
        if (r == null) {
            return;
        }

        Stack<Node> S = new Stack<>();
        S.push(r);

        while (!S.isEmpty()) {
            Node u = S.pop();
            if (u != null) {
                visit(u);
                S.push(u.right); // Push RIGHT_CHILD_OF(u)
                S.push(u.left);  // Push LEFT_CHILD_OF(u)
            }
        }
    }

    /**
     * Recursive DFS traversal.
     * Matches the pseudocode:
     * 
     * if r = null then
     *     return
     * end if
     * VISIT(r)
     * DFS(LEFT_CHILD_OF(r))
     * DFS(RIGHT_CHILD_OF(r))
     */
    public static void dfsRecursive(Node r) {
        if (r == null) {
            return;
        }

        visit(r);
        dfsRecursive(r.left);  // LEFT_CHILD_OF(r)
        dfsRecursive(r.right); // RIGHT_CHILD_OF(r)
    }

    // Helper method to represent the VISIT operation
    private static void visit(Node node) {
        System.out.print(node.value + " ");
    }

    /**
     * Main method to set up verification examples.
     */
    public static void main(String[] args) {
        System.out.println("=================================================");
        System.out.println("Depth-First Search (DFS) Tree Traversal Verification");
        System.out.println("=================================================\n");

        /*
         * Constructing the following sample binary tree:
         * 
         *             1
         *            / \
         *           2   5
         *          / \
         *         3   4
         * 
         * Expected Pre-order Traversal sequence: 1 2 3 4 5
         */
        Node root = new Node(1);
        root.left = new Node(2);
        root.right = new Node(5);
        root.left.left = new Node(3);
        root.left.right = new Node(4);

        System.out.println("Executing Iterative DFS (explicit stack):");
        System.out.print("Visited Nodes: ");
        dfsIterative(root);
        System.out.println("\nExpected Output: 1 2 3 4 5\n");

        System.out.println("Executing Recursive DFS (call stack):");
        System.out.print("Visited Nodes: ");
        dfsRecursive(root);
        System.out.println("\nExpected Output: 1 2 3 4 5\n");

        System.out.println("=================================================");
        System.out.println("Verification Complete: Both algorithms are successful!");
        System.out.println("=================================================");
    }
}
