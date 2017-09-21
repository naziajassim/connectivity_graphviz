### Creating Neural Connectiviy Graphs with Graphviz

- This script generates undirected graphs with edges of varying thickness. 
- The nodes denote brain networks and the edge thickness varies as a function of connectivity weights.
- A sample dataset and sample output graphs are included

### Installing graphviz
#### On Linux:
sudo apt-get install graphviz

#### On Windows:
http://www.graphviz.org/pub/graphviz/stable/windows/graphviz-2.38.msi

After installing the above file the PATH environment variable has to be set, so that 'dot' command can be invoked in any directory. Refer to this link: https://www.computerhope.com/issues/ch000549.htm

The locations in path are seperated by a semicolon. Add a semicolon at the end and add the location of the "dot" binary. For e.g:    C:\WINDOWS\system32;c:\Program Files\Graphviz2.38\bin

### How graphviz works

The graphviz input file follows the 'dot' language syntax. In the header section of the input file the size and resolution of the output image can be specified. Then the nodes shape, color and position are defined. And in the last part the connection between any two nodes are established with a simple sytax, for e.g "4 -- 7" means node 4 is connected to 7. Additionally, the color of the line and the thickness of the line based on the weights can be specified.


### Matlab: auto generate graphviz inputfile

The generation of this graphiz dot files are automated with matlab. The undirected network weights from connectivity_weights.mat is read by undirected_graph.m. The function writedot generates the dot language syntax and writes it to a .txt file. Since the header information remain constant for all images the contents of header.txt are first dumped into all the .txt input files. Since the connectivity matrix is symmetric about the diagonal to avoid duplicate lines only the lower triangle of the matrix is considered. If any element in the matrix has a non-zero value then a line needs to be drawn. The color of the line is decided based on whether it belongs to contrast A or B. If the node is mapping onto itself then a ring is drawn instead of a line. To avoid overlap of the rings the start and end position of the ring for each node are hard-coded at the beginning of the function. The contrast pairs are explicitly established by two arrays setA and setB, please take look at the code to see how the matrix conA and conB are derived.

Run undirected_graph.m to generate contrast_graph_1_2.txt and other similar files

### Execute the dot command to generate images

The following command reads the .txt and generates .png by invoking the dot command:

dot -Kfdp -n contrast_graph_1_2.txt -Tpng -o contrast_graph_1_2.png

All images can be generated in one go by executing run.bat. This scripts will work both as windows batch script and on a linux shell.

