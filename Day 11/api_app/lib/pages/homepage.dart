import 'package:api_app/models/comment-model.dart' show CommentModel;
import 'package:api_app/models/photo-model.dart';
import 'package:api_app/services/api-services.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ApiService apiService = ApiService();

  List<CommentModel> comments = [];
  List<PhotoModel> photos = [];

  bool isLoading = false;


  Future<void> loadComments() async {

    setState(() {
      isLoading = true;
    });

    try {

      comments = await apiService.getComments();

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load comments'),
        ),
      );

    } finally {

      setState(() {
        isLoading = false;
      });
    }
  }


  Future<void> loadPhotos() async {

    setState(() {
      isLoading = true;
    });

    try {

      photos = await apiService.getPhotos();

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load photos'),
        ),
      );

    } finally {

      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Choose Data'),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              ElevatedButton(
                onPressed: loadComments,
                child: const Text('Comments'),
              ),

              ElevatedButton(
                onPressed: loadPhotos,
                child: const Text('Photos'),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : comments.isNotEmpty
                    ? buildComments()
                    : photos.isNotEmpty
                        ? buildPhotos()
                        : const Center(
                            child: Text(
                              'Choose Comments or Photos',
                            ),
                          ),
          ),
        ],
      ),
    );
  }


  Widget buildComments() {

    return ListView.builder(

      itemCount: comments.length,

      itemBuilder: (context, index) {

        final comment = comments[index];

        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),

          child: ListTile(

            title: Text(comment.name),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(comment.email),

                const SizedBox(height: 5),

                Text(comment.body),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget buildPhotos() {

    return GridView.builder(

      padding: const EdgeInsets.all(10),

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),

      itemCount: photos.length,

      itemBuilder: (context, index) {

        final photo = photos[index];

        return Card(
          child: Column(
            children: [

              Expanded(
                child: Image.network(
  'https://picsum.photos/seed/${photo.id}/300/300',
  fit: BoxFit.cover,
  width: double.infinity,
),
              ),

              Padding(
                padding: const EdgeInsets.all(5),

                child: Text(
                  photo.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
